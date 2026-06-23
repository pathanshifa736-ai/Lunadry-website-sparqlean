<?php
require_once __DIR__ . '/init.php';
require_admin_login();

// Inputs
$search_order = isset($_GET['order_number']) ? trim($_GET['order_number']) : '';
$from_date = isset($_GET['from_date']) ? $_GET['from_date'] : '';
$to_date = isset($_GET['to_date']) ? $_GET['to_date'] : '';

$sql = "SELECT * FROM tblinvoice WHERE 1=1";
$params = [];

// ORDER NUMBER FILTER
if ($search_order !== '') {
    $sql .= " AND OrderNumber LIKE :order_number";
    $params[':order_number'] = "%$search_order%";
}

// DATE FILTER
if ($from_date !== '' && $to_date !== '') {
    $sql .= " AND DATE(InvoiceDate) BETWEEN :from_date AND :to_date";
    $params[':from_date'] = $from_date;
    $params[':to_date'] = $to_date;
} elseif ($from_date !== '') {
    $sql .= " AND DATE(InvoiceDate) >= :from_date";
    $params[':from_date'] = $from_date;
} elseif ($to_date !== '') {
    $sql .= " AND DATE(InvoiceDate) <= :to_date";
    $params[':to_date'] = $to_date;
}

$sql .= " ORDER BY InvoiceDate DESC";

$stmt = $pdo->prepare($sql);
$stmt->execute($params);
$invoices = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Invoices</title>

    <style>
        table { width:100%; border-collapse:collapse; margin-top:20px; }
        th, td { padding:10px; border:1px solid #ddd; }
        th { background:#f4f4f4; }
        .search-wrap { padding:10px; background:#fafafa; margin-bottom:20px; }
        input { padding:8px; }
        button { padding:8px 12px; background:#007bff; color:white; border:none; cursor:pointer; }
        .reset-btn { background:#6c757d; }
    </style>
</head>
<body>

<h2>Invoice List</h2>

<form method="get" class="search-wrap">
    <input type="text" name="order_number" placeholder="Search Order Number"
           value="<?= htmlspecialchars($search_order) ?>">

    From:
    <input type="date" name="from_date" value="<?= htmlspecialchars($from_date) ?>">

    To:
    <input type="date" name="to_date" value="<?= htmlspecialchars($to_date) ?>">

    <button type="submit">Search</button>

    <a href="invoice.php"><button type="button" class="reset-btn">Reset</button></a>
</form>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Order No</th>
            <th>Name</th>
            <th>Phone</th>
            <th>Address</th>
            <th>Product</th>
            <th>Qty</th>
            <th>Price</th>
            <th>Total</th>
            <th>Mode</th>
            <th>Status</th>
            <th>Date</th>
        </tr>
    </thead>

    <tbody>
        <?php if ($invoices): ?>
            <?php foreach ($invoices as $row): ?>
                <tr>
                    <td><?= $row['InvoiceID'] ?></td>
                    <td><?= $row['OrderNumber'] ?></td>
                    <td><?= $row['CustomerName'] ?></td>
                    <td><?= $row['CustomerPhone'] ?></td>
                    <td><?= $row['CustomerAddress'] ?></td>
                    <td><?= $row['ProductName'] ?></td>
                    <td><?= $row['Quantity'] ?></td>
                    <td><?= number_format((float)$row['Price'], 2) ?></td>
                    <td><?= number_format((float)$row['TotalAmount'], 2) ?></td>
                    <td><?= $row['PaymentMode'] ?></td>
                    <td><?= $row['PaymentStatus'] ?></td>
                    <td><?= date("d-m-Y", strtotime($row['InvoiceDate'])) ?></td>
                </tr>
            <?php endforeach; ?>
        <?php else: ?>
            <tr><td colspan="12" style="text-align:center;">No records found</td></tr>
        <?php endif; ?>
    </tbody>
</table>

</body>
</html>
