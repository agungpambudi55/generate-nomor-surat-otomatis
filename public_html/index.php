<?php
    include_once("config.php");
?>

<html>
<head>    
    <title>Bawaslu Kab. Mojokerto</title>
</head>

<body>
    <h1>Bawaslu Kabupaten Mojokerto</h1>
    <h2>Generate Nomor Surat Otomatis </h2>

    <form action="index.php" method="post">
        <table width="100%" border="0">
            <tr> 
                <td>Nama Pegawai</td>
                <td><input type="text" name="name" required></td>
            </tr>
            <tr>
                <td>Kode Surat</td>
                <td>
                    <select name="code" required>
                        <option></option>

                        <?php
                            $result_data_code = mysqli_query($mysqli, "SELECT * FROM `tb_code` ORDER BY `code` ASC");

                            while($data_code = mysqli_fetch_array($result_data_code)) {         
                                echo "<option value='".$data_code[0]."'>".$data_code[1]." (".$data_code[2].") </option>";
                            }
                        ?>

                    </select>
                    <a href="https://drive.google.com/file/d/1-4hPzmXNSX833082Utz6e8gQGgXjCV9e/view" target="_blank">Lihat Panduan</a>
                </td>
            </tr>
            <tr>
                <td >Perihal</td>
                <td><textarea name="desc" required></textarea></td>
            </tr>
            <tr> 
                <td></td>
                <td><input type="submit" name="genbawaslu" value="Minta Nomor"> </td>
            </tr>
        </table>
    </form>

    <?php
        if(isset($_POST['genbawaslu'])) {
            $name = $_POST['name'];
            $code = $_POST['code'];
            $desc = $_POST['desc'];

            $result_data_last_number = mysqli_query($mysqli, "SELECT `number` FROM `tb_number` WHERE `id_code` = $code ORDER BY `number` DESC LIMIT 1");

            if (mysqli_num_rows($result_data_last_number) > 0){
                while($last_number = mysqli_fetch_array($result_data_last_number)) {
                    $new_number = $last_number[0] + 1;
                    $insert_new_number = mysqli_query($mysqli, "INSERT INTO `tb_number` (`id_number`, `id_code`, `number`) VALUES (NULL, '$code', '$new_number')");
                }
            }else{
                $insert_new_number = mysqli_query($mysqli, "INSERT INTO `tb_number` (`id_number`, `id_code`, `number`) VALUES (NULL, '$code', '1')");                
            }

            $result_data_last_insert = mysqli_query($mysqli, "SELECT `id_number` FROM `tb_number` ORDER BY `id_number` DESC LIMIT 1");

            while($last_insert = mysqli_fetch_array($result_data_last_insert)) {
                $insert_new_data = mysqli_query($mysqli, "INSERT INTO `tb_request` (`id_request`, `id_number`, `datetime`, `name`, `desc`) VALUES (NULL, '$last_insert[0]', current_timestamp(), '$name', '$desc')");
            }

        }
    ?>

    <h5 style="color: red"> *File PDF dikirim ke staff kearsipan (Khusnul)</h5>

    <table border=1 width="100%">
    <tr>
        <th>Tanggal & Waktu</th>
        <th>Nama Pegawai</th>
        <th>Kode Surat</th>
        <th>Perihal</th>
        <th>Nomor</th>
    </tr>

    <?php  
        $result_data = mysqli_query($mysqli, "SELECT `tb_request`.`datetime`, `tb_request`.`name`, `tb_code`.`desc`, `tb_code`.`code`, `tb_request`.`desc`, `tb_number`.`number` FROM `tb_request`, `tb_number`, `tb_code` WHERE `tb_request`.`id_number` = `tb_number`.`id_number` AND `tb_number`.`id_code` = `tb_code`.`id_code` ORDER BY `tb_request`.`id_request` DESC");

        while($data = mysqli_fetch_array($result_data)) {         
            echo "<tr>";
            echo "<td>".$data[0]."</td>";
            echo "<td>".$data[1]."</td>";
            echo "<td>".$data[3]." (".$data[2].")</td>";
            echo "<td>".$data[4]."</td>";    

            if (strlen((string) $data[5]) == 1){
                echo "<td>00".$data[5]."</td>";
            }else if (strlen((string) $data[5]) == 2){
                echo "<td>0".$data[5]."</td>";
            }else{
                echo "<td>".$data[5]."</td>";
            }

            echo "</tr>";
        }
    ?>
    
    </table>

</body>
</html>