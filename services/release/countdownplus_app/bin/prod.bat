:: Run migrations
call "%~dp0\countdownplus_app" eval CountdownplusWeb.ReleaseTasks.migrate
:: Then start Phoenix server
set PHX_SERVER=true
call "%~dp0\countdownplus_app" start