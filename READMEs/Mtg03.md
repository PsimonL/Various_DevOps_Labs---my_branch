# Zajęcia 02

---
# Git, Docker
- Wykonaj opisane niżej kroki i dokumentuj ich wykonanie
- Na dokumentację składają się następujące elementy:
  - plik tekstowy ze sprawozdaniem, zawierający opisy z każdego z punktów zadania
  - zrzuty ekranu przedstawiające wykonane kroki (oddzielny zrzut ekranu dla każdego kroku)
  - listing historii poleceń (cmd/bash/PowerShell)
- Sprawozdanie z zadania powinno umożliwiać **odtworzenie wykonanych kroków** z wykorzystaniem opisu, poleceń i zrzutów. Oznacza to, że sprawozdanie powinno zawierać opis czynności w odpowiedzi na (także zawarte) kroki z zadania. Przeczytanie dokumentu powinno umożliwiać zapoznanie się z procesem i jego celem bez konieczności otwierania treści zadania.

- Sprawozdanie proszę umieścić w następującej ścieżce: ```<grupa>/<inicjały><numerIndeksu>/Lab01/Sprawozdanie.md```, w formacie Markdown

## Zadania do wykonania
## Zestawienie środowiska
1. Zainstaluj Docker w systemie linuksowym
2. Zarejestruj się w Docker Hub i zapoznaj z sugerowanymi obrazami
3. Pobierz hello-world, busybox, ubuntu lub fedorę, mysql
4. Uruchom busybox
   - Pokaż efekt uruchomienia kontenera
   - Podłącz się do kontenera interaktywnie i wywołaj numer wersji
5. Uruchom "system w kontenerze"
   - Zaprezentuj PID1 w kontenerze i procesy dockera na hoście
   - Zaktualizuj pakiety
   - Wyjdź
6. Stwórz własnoręcznie, zbuduj i uruchom prosty plik Dockerfile bazujący na wybranym systemie i sklonuj nasze repo. 
- Kieruj się dobrymi praktykami: https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
- Upewnij się że obraz będzie miał git'a
- Uruchom w trybie interaktywnym i zweryfikuj że jest tam ściągnięte nasze repozytorium
7. Pokaż uruchomione ( != "działające" ) kontenery, wyczyść je.
8. Wyczyść obrazy
9. Dodaj stworzone pliki Dockefile do folderu swojego Lab2 w repo.
10. Wystaw Pull Request do gałęzi grupowej jako zgłoszenie wykonanego zadania.
