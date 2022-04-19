print("Scrivere il numero di input")
--[[
    “There are only two hard things in computer programming: cache invalidation and naming things.”
    -Phil Karlton
]]
local NumeroDiNumeri = tonumber(io.read()) --richiede un input che ritorna una stringa
if not NumeroDiNumeri then
    error("Bisogna inserire un numero") --se il valore non è un numero allora il codice da un errore
    return
end

local function Fibonacci(Base) --funzione per trovare il valore del numero di fibonacci corrispondente all'argomento passato
    --[[
        function Fibonacci(m)
            if m < 2 then
                return m
                end
            return Fibonacci(m-1) + Fibonacci(m-2)
        end

        Avevo anche trovato questa funzione online con recursione ma ho deciso di riscriverla utilizzando un altro metodo
    ]]
    if Base == 0 then
        return 0
    end
    local Risultato = 1
    local NumeroPrecedente = 0
    for i=1, (Base - 1) do
        local TempPrecedente = Risultato
        Risultato = Risultato + NumeroPrecedente
        NumeroPrecedente = TempPrecedente
    end
    return Risultato
end

print("Scrivere i numeri di cui trovare il corrispettivo nella sequenza di Fibonacci") --richiede una riga di input che ritorna una stringa
local StringaNumeri = io.read()

local Totale = 0 --dichiaro il totale della somma delle cifre (inizialmente 0)
local NumeriTotali = 0 --dichiaro il numero di input che sono stati inseriti
for StringNumero in string.gmatch(StringaNumeri, "([^%s]+)") do --loop per controllare tutti i valori separati da spazio
    NumeriTotali = NumeriTotali + 1
    local Numero = tonumber(StringNumero)
    if not Numero then
        error("Bisogna inserire uno o piu' numeri separati solamente da uno spazio") --se la funzione tonumber() ritorna nil allora non vi erano solamente numeri tra gli spazi
    end
    if Numero > 90 then
        error("I numeri possono valere 90 al massimo") --se il numero è maggiore di 90 il risultato sarebbe sbagliato e quindi ritorna un errore (nella traccia dell'esercizio era esplicito che i numeri fossero minori di 90)
        return
    end
    local NumeroFibo = Fibonacci(Numero) --il numero viene passato alla funzione che ritorna il corrispettivo numero di fibonacci
    print("F("..tostring(Numero)..") = "..tostring(NumeroFibo)) --visualizzazione del risultato che ritorna la funzione
    while NumeroFibo > 0 do --loop del numero per trovarne le cifre
        Totale = Totale + (NumeroFibo % 10) --ogni cifra viene aggiunta al totale dichiarato in precedenza
        NumeroFibo = math.floor(NumeroFibo / 10)
    end
end
print("Somma di tutte le cifre dei numeri = "..tostring(Totale)) --output finale
if NumeroDiNumeri ~= NumeriTotali then
    error("Il numero di input non corrisponde al numero di input forniti") --siccome il numero di input iniziale non ha avuto nessun utilizzo nel codice ho preferito completare il programma e poi dare un errore che spiegava non corrispondessero i due numeri
end
