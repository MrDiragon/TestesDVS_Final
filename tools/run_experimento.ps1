# ============================================
# Script atualizado: 50 rodadas + M2 grande
# ============================================

Write-Host "Iniciando experimento..."

# Caminhos
$resultsDir = "..\results"
$modelsDir = "..\models"
$csvFile = "$resultsDir\resultado_experimento.csv"

# Criar diretório de resultados se não existir
if (!(Test-Path $resultsDir)) {
    New-Item -ItemType Directory -Path $resultsDir | Out-Null
}

# Criar CSV
"Ferramenta,Modelo,Rodada,Tempo_ms,Linhas,Tamanho_bytes" | Out-File $csvFile -Encoding UTF8

# Modelos equivalentes do Jenny (M1 e M2)
$jenny_M1 = "3 3 3"
$jenny_M2 = "50 50 50 50 50 50 50 50 50 50"

# -------- Função genérica de execução --------
function Executar-Testes {
    param(
        [string]$Ferramenta,
        [string]$Modelo,
        [string]$ComandoBase,
        [int]$Rodadas = 50
    )

    for ($i = 1; $i -le $Rodadas; $i++) {

        $outputFile = "$resultsDir\${Ferramenta}_${Modelo}_run${i}.txt"

        # Medir tempo + salvar saída
        $time = Measure-Command { 
            Invoke-Expression $ComandoBase | Out-File $outputFile
        }

        # Métricas de saída
        $lines = (Get-Content $outputFile).Count
        $size = (Get-Item $outputFile).Length

        # Registrar no CSV
        "$Ferramenta,$Modelo,$i,$($time.TotalMilliseconds),$lines,$size" `
            | Out-File $csvFile -Append -Encoding UTF8

        Write-Host "$Ferramenta $Modelo - Rodada $i concluída."
    }
}

# ============================================
# EXECUTAR PICT
# ============================================
Executar-Testes -Ferramenta "PICT" -Modelo "M1" -ComandoBase ".\pict.exe $modelsDir\M1.pict"
Executar-Testes -Ferramenta "PICT" -Modelo "M2" -ComandoBase ".\pict.exe $modelsDir\M2.pict"

# ============================================
# EXECUTAR JENNY
# ============================================
Executar-Testes -Ferramenta "Jenny" -Modelo "M1" -ComandoBase ".\jenny.exe $jenny_M1"
Executar-Testes -Ferramenta "Jenny" -Modelo "M2" -ComandoBase ".\jenny.exe $jenny_M2"

Write-Host "Experimento concluído!"
Write-Host "CSV gerado em: $csvFile"
