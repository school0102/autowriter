use AppleScript version "2.4"
use scripting additions

-- Pega a pasta onde este script está salvo
tell application "Finder"
	set pastaDoScript to container of (path to me) as string
end tell

-- Altere "texto.txt" para o nome do arquivo que está na mesma pasta
set caminhoArquivo to pastaDoScript & "redacao.txt"

-- Lê o conteúdo do arquivo
try
	set userText to read file caminhoArquivo as «class utf8»
on error
	display dialog "O arquivo 'texto.txt' não foi encontrado na mesma pasta deste script!" buttons {"OK"} default button "OK"
	return
end try

display notification "Começando em 5 segundos..." with title "Auto-Writer Active"
delay 5

tell application "System Events"
	repeat with i from 1 to count characters of userText
		set theChar to character i of userText
		
		-- Handle Accents using Dead Key combinations
		if theChar is "ã" then
			keystroke "n" using option down
			keystroke "a"
		else if theChar is "õ" then
			keystroke "n" using option down
			keystroke "o"
		else if theChar is "á" then
			keystroke "e" using option down
			keystroke "a"
		else if theChar is "é" then
			keystroke "e" using option down
			keystroke "e"
		else if theChar is "í" then
			keystroke "e" using option down
			keystroke "i"
		else if theChar is "ó" then
			keystroke "e" using option down
			keystroke "o"
		else if theChar is "ú" then
			keystroke "e" using option down
			keystroke "u"
		else if theChar is "ç" then
			keystroke "c" using option down
		else if theChar is "ê" then
			keystroke "i" using option down
			keystroke "e"
		else if theChar is "à" then
			keystroke "`" using option down
			keystroke "a"
		else if theChar is return or theChar is linefeed then
			key code 36
		else
			keystroke theChar
		end if
		
		delay (random number from 0.02 to 0.1)
	end repeat
end tell
