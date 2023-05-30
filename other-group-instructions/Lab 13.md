# Zajęcia 13 Cloud - AWS

---
# Wykorzystanie chmury AWS do wdrożenia aplikacji webowej
- **UWAGA!** Wykonanie ćwiczenia nie jest obowiązkowe. Termin oddania - koniec semestru.
- Wykonuj opisane niżej kroki i dokumentuj ich wykonanie
- Na dokumentację składają się następujące elementy:
  - plik tekstowy ze sprawozdaniem, zawierający opisy z każdego z punktów zadania
  - zrzuty ekranu przedstawiające wykonane kroki (oddzielny zrzut ekranu dla każdego kroku)
  - listing historii poleceń (cmd/bash/PowerShell)
- Sprawozdanie z zadania powinno umożliwiać **odtworzenie wykonanych kroków** z wykorzystaniem opisu, poleceń i zrzutów. Oznacza to, że sprawozdanie powinno zawierać opis czynności w odpowiedzi na (także zawarte) kroki z zadania. Przeczytanie dokumentu powinno umożliwiać zapoznanie się z procesem i jego celem bez konieczności otwierania treści zadania.

- Sprawozdanie proszę umieścić w następującej ścieżce: ```<grupa>/<inicjały><numerIndeksu>/Lab_13/Sprawozdanie.md```, w formacie Markdown

## Zadania do wykonania
Celem ćwiczenia jest wdrożenie dowolnej aplikacji webowej na chmurze AWS w formie three-tier architecture. Aplikacja powinna składać się co najmniej z następujących komponentów:
- frontendu, np. React, Vue
- backendu, np. Nodejs, Django
- bazy danych z puli dostępnych na chmurze.
Nie ma wymagań co do funkcjonalności - może to być wyświetlanie treści zwracanej przez jeden endopoint, uzupełnianej o dane z bazy danych.
## Polecenia
1. Upewnij się, że wykorzystujesz zasoby regionu us-east-1.
2. Stwórz trzy Security Groupy, umieszczając je w domyślnym VPC:
    1. Dla bazy danych - pozwól na dowolny ruch wychodzący (outbound rules) oraz na _bezpieczny_ przychodzący (inbound rules).
    2. Dla aplikacji backendowej - pozwól na dowolny ruch wychodzący (outbound rules) oraz na _bezpieczny_ przychodzący (inbound rules). Testowo należy dodać możliwość komunikacji poprzez SSH.
    3. Dla aplikacji frontendowej - pozwól na dowolny ruch wychodzący (outbound rules) oraz _bezpieczny_ przychodzący (inbound rules). Testowo należy dodać możliwość komunikacji poprzez SSH.
3. Stwórz maszyny wirtualne dla aplikacji backendowej oraz frontendowej w ramach usługi EC2. Zalecane parametry:
    - System operacyjny: Amazon Linux 2 (ami-006dcf34c09e50022)
    - Typ instancji: t2.micro
    - VPC: domyślnie stworzone
    - Umieść maszyny we właściwych Security Groupach stworzonych w punkcie 2
4. Skonfiguruj maszyny wirtualne dla aplikacji backendowej oraz frontendowej, by mogły zostać prawidłowo uruchomione.
5. Stwórz bazę danych w dowolnej usłudze bazodanowej. Zalecane parametry:
    - Usługa RDS
    - Baza mysql
    - Template: free tier
    - Typ instancji: dowolny micro lub small
    - Dostęp publiczny ustawić na wyłączony (domyślna wartość)
    - Umieść tworzoną bazę w Security Groupie stworzonej w punkcie 2b
    - Wyłącz performance insights, backup oraz encryption (mogą mieć wpływ na koszty)
6. Zweryfikuj:
    1. Połączenie pomiędzy backendem a bazą danych. W razie potrzeby wgraj backup bazy z poziomu maszyny EC2.
    2. Połączenie pomiędzy frontendem a backendem.
    3. Dostępność frontendu z adresu publicznego.
    4. Brak dostępu do backendu oraz bazy danych z adresów publicznych.
7. Po weryfikacji usuń **wszystkie** zasoby, stworzone w ramach ćwiczenia. Udokumentuj to w sprawozdaniu!
8. Dodaj wszystkie pliki do swojej gałęzi do folderu Lab_cloud.
9. Wystaw Pull Request do gałęzi grupowej jako zgłoszenie wykonanego zadania. Kod źródłowy aplikacji może znajdować się w innym repozytorium, jednak wówczas należy do sprawozdania dołączyć do niego link.
