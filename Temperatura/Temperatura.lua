print("Scrivere il numero di input")

local NumeroDiValori = tonumber(io.read()) --Richiedo il numero di valori da inserire
if not NumeroDiValori then
    error("Bisogna inserire un numero") --Se il valore non è un numero allora la funzione ritorna un errore
    return
end

print("Scrivere i valori da controllare")

local StringaValori = io.read() --Richiedo una stringa di valori da controllare successivamente

local NumeroVicino = math.huge --Pongo come numero più vicino iniziale il valore più alto possibile (che quindi risulterà maggiore di qualsiasi numero)
local NumeriTotali = 0 --Controllo i numeri forniti per poi paragonarli al numero di valori alla fine
for StringaNumero in string.gmatch(StringaValori, "([^%s]+)") do
    NumeriTotali = NumeriTotali + 1 --Aggiungo 1 per ogni ciclo ai numeri totali
    local Numero = tonumber(StringaNumero)
    local NumeroNegativo = (Numero < 0)
    local ValoreAssoluto = math.abs(Numero) --Trasformo il numero in valore assoluto così da paragonarlo più facilmente
    if ValoreAssoluto < math.abs(NumeroVicino) then
        NumeroVicino = Numero
    elseif ValoreAssoluto == math.abs(NumeroVicino) then --Paragono il valore assoluto del numero fornito con il valore assoluto del corrente numero più vicino e agisco di conseguenza
        if not NumeroNegativo then
            NumeroVicino = Numero
        end
    end
end

print("Il numero piu' vicino allo 0 tra quelli forniti e' "..tostring(NumeroVicino))

if not (NumeriTotali == NumeroDiValori) then
    error("Il numero di input non corrisponde al numero di input forniti") --siccome il numero di input iniziale non ha avuto nessun utilizzo nel codice ho preferito completare il programma e poi dare un errore che spiegava non corrispondessero i due numeri
end
