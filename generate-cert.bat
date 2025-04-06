@echo off
setlocal

:: Tên thư mục chứa file certs
set "CERT_DIR=%USERPROFILE%\Documents\ssl-certs"

:: Tạo thư mục nếu chưa có
if not exist "%CERT_DIR%" (
    mkdir "%CERT_DIR%"
)

cd /d "%CERT_DIR%"

echo Generating SSL certificates in: %CERT_DIR%

:: Tạo private key + self-signed cert
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout localhost.key -out localhost.crt -subj "/C=VN/ST=HCM/L=District1/O=LocalDev/OU=Dev/CN=localhost"

:: Tạo thêm file .cer từ .crt (DER format)
openssl x509 -in localhost.crt -out localhost.cer -outform DER

echo.
echo ✅ Done! 3 files created:
echo - localhost.key
echo - localhost.crt
echo - localhost.cer
echo.
echo 📂 Path: %CERT_DIR%

pause
