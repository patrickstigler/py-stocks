<h1 align="center">
  <br>
  PY-Stocks
  <br>
</h1>

<h4 align="center">A minimal stocks API wrapper of <a href="https://github.com/ranaroussi/yfinance" target="_blank">yfinance</a>.</h4>
<p align="center">
  <a href="#build">Build</a> •
  <a href="#endpoints">Endpoints</a> •
  <a href="#credits">Credits</a> •
  <a href="#license">License</a>
</p>

<h3> Forked from pinkahd for a Unraid container</h3>


## Docker

You can use the image:
patrickstigler/py-stocks-api

You only need to expose the container port 8000 and it should work.


## Build

To clone and run this application, you'll need [Git](https://git-scm.com) and [Docker](https://www.docker.com/get-started) installed on your computer. From your command line:

```bash
# Clone this repository
$ git clone https://github.com/patrickstigler/py-stocks

# Go into the repository
$ cd py-stocks

# Build the image
$ docker build . -t py-stocks

# Run the app
$ docker run -p 8000:8000 py-stocks
```

## Endpoints

### Download

The `/download/:symbol/:startDate/:endDate` endpoint takes a symbol and a start and end date

Params:

- `interval` default `1d`

Example command

```bash
curl localhost:8000/download/AAPL/2021-08-01/2021-08-03 | jq
```

JSON Response

```json
{"schema":
{"fields":[{"name":"Date","type":"datetime"},{"name":"Open","type":"number"},
{"name":"High","type":"number"},{"name":"Low","type":"number"},{"name":"Close","type":"number"},
{"name":"Adj Close","type":"number"},{"name":"Volume","type":"integer"}],"primaryKey":["Date"],"pandas_version":"0.20.0"},
"data":[{"Date":"2019-12-31T00:00:00.000Z","Open":289.9299926758,"High":293.6799926758,"Low":289.5199890137,"Close":293.6499938965,"Adj Close":289.8670349121,"Volume":25247625}]}
```


### History

The `/history/:symbol/` endpoint takes a symbol

Params:

- will download all available data about the symbol

Example command

```bash
curl localhost:8000/history/AAPL/ | jq
```

JSON Response

```json
{"schema":{"fields":[{"name":"Date","type":"datetime"},{"name":"Open","type":"number"},{"name":"High","type":"number"},{"name":"Low","type":"number"},{"name":"Close","type":"number"},{"name":"Volume","type":"integer"},{"name":"Dividends","type":"number"},{"name":"Stock Splits","type":"number"}],"primaryKey":["Date"],"pandas_version":"0.20.0"},"data":[{"Date":"1980-12-12T00:00:00.000Z","Open":0.4784811735,"High":0.4805576009,"Low":0.4784811735,"Close":0.4784811735,"Volume":117258400,"Dividends":0.0,"Stock Splits":0.0},{"Date":"1980-12-15T00:00:00.000Z","Open":0.4535170794,"High":0.4555935627,"Low":0.4535170794,"Close":0.4535170794,"Volume":43971200,"Dividends":0.0,"Stock Splits":0.0},{"Date":"1980-12-16T00:00:00.000Z","Open":0.4202322364,"High":0.4223087202,"Low":0.4202322364,"Close":0.4202322364,"Volume":26432000,"Dividends":0.0,"Stock Splits":0.0},{"Date":"1980-12-17T00:00:00.000Z","Open":0.4306303263,"High":0.4327067819,"Low":0.4306303263,"Close":0.4306303263,"Volume":21610400,"Dividends":0.0,"Stock Splits":0.0},{"Date":"1980-12-18T00:00:00.000Z","Open":0.4431188107,"High":0.4451952656,"Low":0.4431188107,"Close":0.4431188107,"Volume":18362400,"Dividends":0.0,"Stock Splits":0.0},{"Date":"1980-12-19T00:00:00.000Z","Open":0.4701594412,"High":0.4722368129,"Low":0.4701594412,"Close":0.4701594412,"Volume":12157600,"Dividends":0.0,"Stock Splits":0.0},{"Date":"1980-12-22T00:00:00.000Z","Open":0.4930462837,"High":0.4951236558,"Low":0.4930462837,"Close":0.4930462837,"Volume":9340800,"Dividends":0.0,"Stock Splits":0.0},{"Date":"1980-12-23T00:00:00.000Z","Open":0.5138424039,"High":0.5159197751,"Low":0.5138424039,"Close":0.5138424039,"Volume":11737600,"Dividends":0.0,"Stock Splits":0.0},{"Date":"2021-12-10T00:00:00.000Z","Open":175.2050018311,"High":177.5680999756,"Low":174.6999969482,"Close":177.4848022461,"Volume":61115558,"Dividends":0.0,"Stock Splits":0.0}]}
```

### Info

The `/info/:symbol` endpoint takes a symbol and return company information and the current price.

Example command:

```bash
curl localhost:8000/info/AAPL | jq
```

JSON Response:

```json
{
  "52WeekChange": 0.18871057,
  "SandP52WeekChange": 0.2816925,
  "address1": "One Apple Park Way",
  "algorithm": null,
  "annualHoldingsTurnover": null,
  "annualReportExpenseRatio": null,
  "ask": 0,
  "askSize": 1800,
  "averageDailyVolume10Day": 70456128,
  "averageVolume": 77309822,
  "averageVolume10days": 70456128,
  "beta": 1.202797,
  "beta3Year": null,
  "bid": 0,
  "bidSize": 1200,
  "bookValue": 3.882,
  "category": null,
  "circulatingSupply": null,
  "city": "Cupertino",
  "companyOfficers": [],
  "country": "United States",
  "currency": "USD",
  "currentPrice": 147.54,
  "currentRatio": 1.062,
  "dateShortInterest": 1628812800,
  "dayHigh": 149.12,
  "dayLow": 147.51,
  "debtToEquity": 210.782,
  "dividendRate": 0.88,
  "dividendYield": 0.006,
  "earningsGrowth": 1,
  "earningsQuarterlyGrowth": 0.932,
  "ebitda": 110934999040,
  "ebitdaMargins": 0.31955,
  "enterpriseToEbitda": 22.65,
  "enterpriseToRevenue": 7.238,
  "enterpriseValue": 2512655745024,
  "exDividendDate": 1628208000,
  "exchange": "NMS",
  "exchangeTimezoneName": "America/New_York",
  "exchangeTimezoneShortName": "EDT",
  "expireDate": null,
  "fiftyDayAverage": 146.94086,
  "fiftyTwoWeekHigh": 151.68,
  "fiftyTwoWeekLow": 103.1,
  "financialCurrency": "USD",
  "fiveYearAverageReturn": null,
  "fiveYearAvgDividendYield": 1.29,
  "floatShares": 16513305231,
  "forwardEps": 5.67,
  "forwardPE": 26.021162,
  "freeCashflow": 80625876992,
  "fromCurrency": null,
  "fullTimeEmployees": 147000,
  "fundFamily": null,
  "fundInceptionDate": null,
  "gmtOffSetMilliseconds": "-14400000",
  "grossMargins": 0.41005,
  "grossProfits": 104956000000,
  "heldPercentInsiders": 0.00071000005,
  "heldPercentInstitutions": 0.58426,
  "impliedSharesOutstanding": null,
  "industry": "Consumer Electronics",
  "isEsgPopulated": false,
  "lastCapGain": null,
  "lastDividendDate": null,
  "lastDividendValue": null,
  "lastFiscalYearEnd": 1601078400,
  "lastMarket": null,
  "lastSplitDate": null,
  "lastSplitFactor": null,
  "legalType": null,
  "logo_url": "https://logo.clearbit.com/apple.com",
  "longBusinessSummary": "Apple Inc. designs, manufactures, and markets smartphones, personal computers, tablets, wearables, and accessories worldwide. It also sells various related services. The company offers iPhone, a line of smartphones; Mac, a line of personal computers; iPad, a line of multi-purpose tablets; and wearables, home, and accessories comprising AirPods, Apple TV, Apple Watch, Beats products, HomePod, iPod touch, and other Apple-branded and third-party accessories. It also provides AppleCare support services; cloud services store services; and operates various platforms, including the App Store, that allow customers to discover and download applications and digital content, such as books, music, video, games, and podcasts. In addition, the company offers various services, such as Apple Arcade, a game subscription service; Apple Music, which offers users a curated listening experience with on-demand radio stations; Apple News+, a subscription news and magazine service; Apple TV+, which offers exclusive original content; Apple Card, a co-branded credit card; and Apple Pay, a cashless payment service, as well as licenses its intellectual property. The company serves consumers, and small and mid-sized businesses; and the education, enterprise, and government markets. It sells and delivers third-party applications for its products through the App Store. The company also sells its products through its retail and online stores, and direct sales force; and third-party cellular network carriers, wholesalers, retailers, and resellers. Apple Inc. was founded in 1977 and is headquartered in Cupertino, California.",
  "longName": "Apple Inc.",
  "market": "us_market",
  "marketCap": 2438865616896,
  "maxAge": 1,
  "maxSupply": null,
  "messageBoardId": "finmb_24937",
  "morningStarOverallRating": null,
  "morningStarRiskRating": null,
  "mostRecentQuarter": 1624665600,
  "navPrice": null,
  "netIncomeToCommon": 86801997824,
  "nextFiscalYearEnd": 1664150400,
  "numberOfAnalystOpinions": 41,
  "open": 148.35,
  "openInterest": null,
  "operatingCashflow": 104414003200,
  "operatingMargins": 0.28788,
  "payoutRatio": 0.16309999,
  "pegRatio": 1.34,
  "phone": "408-996-1010",
  "previousClose": 148.36,
  "priceHint": 2,
  "priceToBook": 38.00618,
  "priceToSalesTrailing12Months": 7.025293,
  "profitMargins": 0.25004,
  "quickRatio": 0.887,
  "quoteType": "EQUITY",
  "recommendationKey": "buy",
  "recommendationMean": 2,
  "regularMarketDayHigh": 149.12,
  "regularMarketDayLow": 147.51,
  "regularMarketOpen": 148.35,
  "regularMarketPreviousClose": 148.36,
  "regularMarketPrice": 147.54,
  "regularMarketVolume": 48597195,
  "returnOnAssets": 0.19302,
  "returnOnEquity": 1.27125,
  "revenueGrowth": 0.364,
  "revenuePerShare": 20.61,
  "revenueQuarterlyGrowth": null,
  "sector": "Technology",
  "sharesOutstanding": 16530199552,
  "sharesPercentSharesOut": 0.0056,
  "sharesShort": 93105968,
  "sharesShortPreviousMonthDate": 1626307200,
  "sharesShortPriorMonth": 96355309,
  "shortName": "Apple Inc.",
  "shortPercentOfFloat": 0.0056,
  "shortRatio": 1.19,
  "startDate": null,
  "state": "CA",
  "strikePrice": null,
  "symbol": "AAPL",
  "targetHighPrice": 190,
  "targetLowPrice": 132,
  "targetMeanPrice": 165.87,
  "targetMedianPrice": 168,
  "threeYearAverageReturn": null,
  "toCurrency": null,
  "totalAssets": null,
  "totalCash": 61696000000,
  "totalCashPerShare": 3.732,
  "totalDebt": 135491002368,
  "totalRevenue": 347155005440,
  "tradeable": false,
  "trailingAnnualDividendRate": 0.835,
  "trailingAnnualDividendYield": 0.0056282016,
  "trailingEps": 5.108,
  "trailingPE": 28.884104,
  "twoHundredDayAverage": 133.05403,
  "volume": 48597195,
  "volume24Hr": null,
  "volumeAllCurrencies": null,
  "website": "http://www.apple.com",
  "yield": null,
  "ytdReturn": null,
  "zip": "95014"
}
```

## Credits

This software uses the following open source packages:

- [PY-Stocks](https://github.com/pinkahd)
- [yfinance](https://pypi.org/project/yfinance/)
- [gunicorn](https://gunicorn.org/)
- [Flask](https://flask.palletsprojects.com)

## License

PY-Stocks is released under the [MIT License](https://opensource.org/licenses/MIT).

