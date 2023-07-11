<?php
$uploadDirectory = '/path/to/upload/directory/';

if ($_FILES['upload']['error'] === UPLOAD_ERR_OK) {
    $tempName = $_FILES['upload']['tmp_name'];
    $fileName = $_FILES['upload']['name'];
    $destination = $uploadDirectory . $fileName;

    move_uploaded_file($tempName, $destination);

    $uploadedUrl = 'http://example.com/uploads/' . $fileName;

    echo json_encode([
        'uploaded' => 1,
        'fileName' => $fileName,
        'url' => $uploadedUrl
    ]);
} else {
    echo json_encode([
        'uploaded' => 0,
        'error' => 'Image upload failed.'
    ]);
}
?>