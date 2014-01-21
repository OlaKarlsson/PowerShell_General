Set-ExecutionPolicy RemoteSigned -Scope Process
$dataSource = "datasource"
$user = "user"
$pwd = "password"
$database = "database"
$connectionString = "Server=$dataSource;uid=$user; pwd=$pwd;Database=$database;Integrated Security=False;Trusted_Connection=False;Encrypt=True;Connection Timeout=30;"

$param1 = "test parameter 1"
$param2 = "test parameter 2"
$param3 = "test parameter 3"

$query = "EXEC dbo.SPName '${param1}', '${param2}', '${param3}'"


$connection = New-Object System.Data.SqlClient.SqlConnection
$connection.ConnectionString = $connectionString
$connection.Open()
$command = $connection.CreateCommand()
$command.CommandText  = $query

$result = $command.ExecuteReader()


$connection.Close()
