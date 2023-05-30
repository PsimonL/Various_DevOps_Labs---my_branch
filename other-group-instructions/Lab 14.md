# Zajęcia 14 Cloud - AWS + Terraform

---
# Wykorzystanie chmury AWS do wdrożenia aplikacji webowej
- **UWAGA!** Wykonanie ćwiczenia nie jest obowiązkowe. Termin oddania - koniec semestru.
- Wykonuj opisane niżej kroki i dokumentuj ich wykonanie
- Na dokumentację składają się następujące elementy:
  - plik tekstowy ze sprawozdaniem, zawierający opisy z każdego z punktów zadania
  - zrzuty ekranu przedstawiające wykonane kroki (oddzielny zrzut ekranu dla każdego kroku)
  - listing historii poleceń (cmd/bash/PowerShell)
- Sprawozdanie z zadania powinno umożliwiać **odtworzenie wykonanych kroków** z wykorzystaniem opisu, poleceń i zrzutów. Oznacza to, że sprawozdanie powinno zawierać opis czynności w odpowiedzi na (także zawarte) kroki z zadania. Przeczytanie dokumentu powinno umożliwiać zapoznanie się z procesem i jego celem bez konieczności otwierania treści zadania.

- Sprawozdanie proszę umieścić w następującej ścieżce: ```<grupa>/<inicjały><numerIndeksu>/Lab_cloud/Sprawozdanie.md```, w formacie Markdown

## Zadania do wykonania
Celem ćwiczenia jest wdrożenie dowolnej aplikacji webowej na chmurze AWS w formie three-tier architecture z wykorzystaniem Terraforma. Aplikacja powinna składać się co najmniej z następujących komponentów:
- frontendu, np. React, Vue
- backendu, np. Nodejs, Django
- bazy danych z puli dostępnych na chmurze.
Nie ma wymagań co do funkcjonalności - może to być wyświetlanie treści zwracanej przez jeden endopoint, uzupełnianej o dane z bazy danych.
## Polecenie
Stwórz infrastrukturę na chmurze AWS jak w [Lab 13 Cloud AWS](/LAB_INSTRUCTIONS/Lab%2013.md) wykorzystując Terraforma.