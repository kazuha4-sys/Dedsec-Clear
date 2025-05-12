:: Update + Install zsh, git, curl, neofetch
wsl bash -c "sudo apt update && sudo apt install -y zsh git curl neofetch fonts-powerline"

:: Instalar Oh-My-ZSH
echo [*] Instalando Oh-My-ZSH...
wsl bash -c "sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\" --unattended"

:: Instalar Powerlevel10k
echo [*] Instalando Powerlevel10k...
wsl bash -c "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \${ZSH_CUSTOM:-\${HOME}/.oh-my-zsh/custom}/themes/powerlevel10k"

:: Configurar Powerlevel10k no .zshrc
echo [*] Configurando tema Powerlevel10k no .zshrc...
wsl bash -c "sed -i 's/ZSH_THEME=.*/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/' ~/.zshrc"

echo.
echo ===============================
echo BAIXANDO FONTES NERD (MesloLGS)
echo ===============================

:: Criar pasta temporária pras fontes
mkdir "%temp%\meslo-fonts"

:: Baixar MesloLGS Nerd Font
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf' -OutFile '%temp%\meslo-fonts\MesloLGS NF Regular.ttf'"
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf' -OutFile '%temp%\meslo-fonts\MesloLGS NF Bold.ttf'"
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf' -OutFile '%temp%\meslo-fonts\MesloLGS NF Italic.ttf'"
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf' -OutFile '%temp%\meslo-fonts\MesloLGS NF Bold Italic.ttf'"

:: Instalar fontes MesloLGS NF
echo [*] Instalando fontes MesloLGS NF...
for %%f in ("%temp%\meslo-fonts\*.ttf") do (
    powershell -Command "Start-Process '%%f' -Verb install"
)

echo.
echo ===============================
echo INSTALAÇÃO TERMINADA!
echo > Abre o Ubuntu, digita: zsh
echo > Depois roda: p10k configure
echo > Vai nas config do Windows Terminal e escolhe a fonte: MesloLGS NF
echo ===============================
pause
