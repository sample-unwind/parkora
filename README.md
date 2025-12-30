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
- **Infrastruktura**: Azure (Terraform, AKS, GHCR, Kong API Gateway)
- **Avtentikacija**: Keycloak
- **Monitoring**: Prometheus, Grafana, Alertmanager
- **Logging**: Elasticsearch, Filebeat, Kibana (EFK Stack)
- **CI/CD**: GitHub Actions

## Azure Key Vault

Projekt uporablja en skupen Azure Key Vault z ločenimi skrivnostmi per mikrostoritev. Naming convention:

| Mikrostoritev | Primer skrivnosti |
|---------------|-------------------|
| user-service | `user-service-db-password`, `user-service-jwt-secret` |
| parking-service | `parking-service-db-password`, `parking-service-weather-api-key` |
| reservation-service | `reservation-service-db-password` |
| payment-service | `payment-service-db-password`, `payment-service-grpc-cert` |
| notification-service | `notification-service-rabbitmq-password` |
| scraper-service | `scraper-service-db-password` |

Dostop do skrivnosti v K8s poteka preko Azure Key Vault CSI Driver (SecretProviderClass).

## Monitoring & Logging Access

| Service | URL | Credentials |
|---------|-----|-------------|
| **Grafana** | https://grafana.parkora.crn.si/ | admin / admin |
| **Kibana** | https://kibana.parkora.crn.si/ | elastic / NILXDRm5Em3FOFOG |
| **Prometheus** | Internal access via Grafana | N/A |

## Container Registry (GHCR)

Projekt uporablja **GitHub Container Registry (ghcr.io)** za shranjevanje Docker slik.

| Servis | Image URL | Status |
|--------|-----------|--------|
| frontend | `ghcr.io/sample-unwind/frontend` | ✅ Deployed |
| user-service | `ghcr.io/sample-unwind/user-service` | Pending |
| parking-service | `ghcr.io/sample-unwind/parking-service` | ✅ Deployed |
| reservation-service | `ghcr.io/sample-unwind/reservation-service` | Pending |
| payment-service | `ghcr.io/sample-unwind/payment-service` | Pending |
| notification-service | `ghcr.io/sample-unwind/notification-service` | Pending |
| scraper-service | `ghcr.io/sample-unwind/scraper-service` | Pending |

Podrobnosti o infrastrukturi in Key Vault uporabi so v [core_infra repozitoriju](https://github.com/sample-unwind/core_infra).

## Mikrostoritve

- Avtentikacija: Varno prijava in registracija uporabnikov.
- Uporabniki: Upravljanje profilov in osebnih podatkov.
- Pregled parkirišč: Realnočasni pregled zasedenosti, cen in lokacij.
- Rezervacije: Rezervacija in pregled aktivnih rezervacij.
- Plačila: Hitro in varno plačevanje parkirnin.
- Priljubljena parkirišča: Označevanje in hiter dostop do pogostih lokacij.
- Scraper: Samodejno pridobivanje podatkov iz zunanjih virov.

## CI/CD

Vsaka mikrostoritev ima lasten cevovod GitHub Actions za avtomatizirano kontinuirano integracijo in uvajanje. Cevovodi obravnavajo linting, testiranje, gradnjo Docker slik in uvajanje v Kubernetes. Podrobnosti so specifične za vsako storitev in dokumentirane v njihovih README datotekah.

## Razvoj in Veje

### Strategija vej
- `main` ali `master`: Produkcijska veja, ki vsebuje stabilno kodo za izdajo.
- `dev`: Razvojna veja za integracijo novih funkcij in testiranje.

### Navodila za razvoj
1. Začne z vejo `dev` za večino razvoja.
2. Za nove funkcionalnosti ustvari vejo `feature/<ime-funkcionalnosti>` iz `dev`.
3. Po dokončanju funkcionalnosti ustvari pull request (PR) iz `feature/<ime>` v `dev`.
4. Ko je `dev` stabilen in testiran, ustvari PR iz `dev` v `main` za izdajo.
5. Veja `main` mora biti vedno stabilna in pripravljena za produkcijo.

### Začetek dela
- Kloniraj repozitorij: `git clone <url>`
- Preklopi na dev: `git checkout dev`
- Ustvari novo vejo za funkcionalnost: `git checkout -b feature/ime-funkcionalnosti`

## Monitoring Features

- **Real-time Metrics**: CPU, memory, network usage across all services
- **Log Aggregation**: Centralized logging with searchable dashboards
- **Service Health**: Pod status, restarts, and error tracking
- **API Monitoring**: Request rates, response times, error rates
- **Alerting**: Configurable alerts for critical issues
- **Visualizations**: Pre-built dashboards for Kubernetes and application metrics

## Primer uporabe

Študent želi rezervirati parkirno mesto blizu fakultete. Ustvari račun, poišče primerno parkirišče, preveri zasedenost in ceno, rezervira mesto za želeni termin, plača digitalno ter doda lokacijo med priljubljene za hitrejši dostop v prihodnje.
