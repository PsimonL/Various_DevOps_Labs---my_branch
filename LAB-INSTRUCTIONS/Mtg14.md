# Zajęcia 13

# Wdrażanie na zarządzalne kontenery w chmurze
## Format sprawozdania
- Wykonaj opisane niżej kroki i dokumentuj ich wykonanie
- Na dokumentację składają się następujące elementy:
  - plik tekstowy ze sprawozdaniem, zawierający opisy z każdego z punktów zadania
  - zrzuty ekranu przedstawiające wykonane kroki (oddzielny zrzut ekranu dla każdego kroku)
  - listing historii poleceń (cmd/bash/PowerShell)
- Sprawozdanie z zadania powinno zawierać dowód na przeprowadzenie wdrożenia
- Sprawozdanie proszę umieścić w następującej ścieżce: ```<kierunek>/<grupa>/<inicjały><numerIndeksu>/Lab14/Sprawozdanie.md```, w formacie Markdown
- Jest to opcjonalne zadanie dla osób które chcą konfigurować pipeline via GitHub

# GitHub Actions
## Zadania do wykonania
 - Zapoznaj się z koncepcją GitHub Actions
   https://docs.github.com/en/actions
 - Zwróć szczególną uwagę na trigger, omawiany na zajęciach
 - Cennik do przeczytania (ze zrozumieniem!!):
   https://docs.github.com/en/billing/managing-billing-for-github-actions/about-billing-for-github-actions
 - **Darmowy plan** powinien wystarczyć przynajmniej do zdefiniowania przykładu
 - Sforkuj repozytorium z wybranym oprogramowaniem. **Nie commituj pipeline'ów do głównego projektu!!**
 - Stwórz akcję przeprowadzającą build na podstawie *kontrybucji* do dedykowanej gałęzi `ino_dev`
  - Usuń obecne w projekcie *workflows*, jeżeli istnieją
  - Utwórz własną akcję reagującą na zmianę w `ino_dev`
  - Zweryfikuj, że wybrany program buduje się wewnątrz Akcji po zacommitowaniu zmiany do gałęzi
  - Jeżeli build jest zbyt duży, zmodyfikuje akcję aby wykonywała inną czynność
 
