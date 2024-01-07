# 2023_Analysis_03-visual

## Podaci o autoru i analiziranom projektu
Autor: Matija Lojović 1017/2023

Projekat: Visual je studentski projekat napravljen sa idejom da olakša vizuelizaciju i razumevanje grafovskih algoritama. Omogućeno je unošenje usmerenih i neusmerenih grafova, kao i pokretanje različitih algoritama, poput BFS, DFS, MST, Dijkstra...

Link do projekta, grana i heš kod commita: [Projekat](https://gitlab.com/matf-bg-ac-rs/course-rs/projects-2022-2023/03-visual), main, 9eac32afc59518ff55f755efbf08048a4379bb44

## Alati i uputstvo za pokretanje

Spisak alata:
* clang-tidy
* memcheck
* perf + FlameGraph
* flawfinder
* cachegrind

Svaki od alata ima u odgovarajućem folderu skriptu koja ga pokreće i upisuje rezultate izvršavanja u novi fajl. 

## Zaključci

Sveukupni utisak dobijen analizom ovog projekta ukazuje da je on prilično kvalitetan. Zamerke koje su nađene tiču se jednog propusta u proveri vrednosti promenljivih koje mogu biti null, neoslobađanja memorije kod jednog vektora objekata, kao i potencijalnih bezbednosnih rizika pri otvaranju datoteka. Proverene su i performanse kroz profajliranje keš memorije i oslikavanje stanja steka tokom izvršavanja i došlo se do zaključka da su algoritmi napisani tako da program radi prilično efikasno. Ostaje da se potencijalno produbi analiza pojedinačnih algoritama za različite ulaze, kako bi se našli dalji smerovi za optimizaciju.

Detaljnija analiza može se naći u pdf-u ProjectAnalysisReport.

