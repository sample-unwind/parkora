# Parkora

## Opis projekta

Parkora je inovativna aplikacija, ki voznikom omogoča pregled prostih parkirnih mest, enostavno plačevanje parkirišč in rezervacijo parkirnega mesta vnaprej, vse na enem mestu. Uporabniki lahko v realnem času spremljajo razpoložljivost parkirišč, opravijo hitro in varno plačilo ter si z nekaj kliki zagotovijo parkirno mesto še pred prihodom. Za dodatno udobje lahko parkirišča označijo z zvezdico in jih dodajo med priljubljene, kar omogoča hiter dostop do pogosto uporabljenih lokacij. S kombinacijo intuitivnega vmesnika, pametnih funkcij in preglednih informacij Parkora poenostavlja vsakodnevno parkiranje in prihrani dragocen čas voznikov.

## Člani skupine

- Šane Bucan (63220036)
- Stjepan Sazonov (63220288)
- Gregor Bucar (63220037)

## Tehnologije

- **Backend**: Python, FastAPI
- **Frontend**: Svelte, Tailwind CSS
- **Podatkovna baza**: PostgreSQL
- **Deployment**: Docker, Kubernetes
- **Infrastruktura**: Azure (Terraform, AKS, ACR, Kong API Gateway)
- **Avtentikacija**: Keycloak
- **Monitoring**: Prometheus, Grafana
- **Logging**: EFK Stack
- **CI/CD**: GitHub Actions

## Mikrostoritve

- Avtentikacija: Varno prijava in registracija uporabnikov.
- Uporabniki: Upravljanje profilov in osebnih podatkov.
- Pregled parkirišč: Realnočasni pregled zasedenosti, cen in lokacij.
- Rezervacije: Rezervacija in pregled aktivnih rezervacij.
- Plačila: Hitro in varno plačevanje parkirnin.
- Priljubljena parkirišča: Označevanje in hiter dostop do pogostih lokacij.
- Scraper: Samodejno pridobivanje podatkov iz zunanjih virov.

## Primer uporabe

Študent želi rezervirati parkirno mesto blizu fakultete. Ustvari račun, poišče primerno parkirišče, preveri zasedenost in ceno, rezervira mesto za želeni termin, plača digitalno ter doda lokacijo med priljubljene za hitrejši dostop v prihodnje.