param (
    [string]$hostName
)

$valuesFile='values.yaml'
$hostObjct = Get-Content $valuesFile
$host = $hostObjct[37].split(" ")[7]

Describe 'Cart Host' {
  It 'A test that should be true' {
    $host  | Should -Be $hostName
  }
}