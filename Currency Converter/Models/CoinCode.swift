//
//  CoinCode.swift
//  Currency Converter
//
//  Created by Filipe Ramos on 08/08/2024.
//

import Foundation

enum CoinCode: String, Codable, CaseIterable {
    case EUR, USD, AFN, ALL, DZD, AOA, ARS, AMD, AWG, AUD, AZN, BSD, BHD, BDT, BBD, BYN, BZD, BMD, BTN, INR, BOB, BOV, BAM, BWP, NOK, BRL, BND, BGN, BIF, CVE, KHR, CAD, KYD, CLF, CLP, CNY, COP, COU, KMF, CDF, NZD, CRC, CUC, CUP, CZK, DKK, DJF, DOP, EGP, SVC, ERN, ETB, FKP, FJD, GMD, GEL, GHS, GIP, GTQ, GBP, GNF, GYD, HTG, HNL, HKD, HUF, ISK, IDR, IRR, IQD, ILS, JMD, JPY, JOD, KZT, KES, KPW, KRW, KWD, KGS, LAK, LBP, LSL, ZAR, LRD, LYD, CHF, MOP, MGA, MWK, MYR, MVR, MRU, MUR, MXN, MXV, MDL, MNT, MAD, MZN, MMK, NAD, NPR, NIO, NGN, OMR, PKR, PAB, PGK, PYG, PEN, PHP, PLN, QAR, MKD, RON, RUB, RWF, SHP, WST, STN, SAR, RSD, SCR, SLE, SGD, SBD, SOS, SSP, LKR, SDG, SRD, SZL, SEK, CHE, CHW, SYP, TWD, TJS, TZS, THB, TOP, TTD, TND, TRY, TMT, UGX, UAH, AED, USN, UYI, UYU, UZS, VUV, VEF, VED, VND, YER, ZMW, ZWL
}

extension CoinCode {
    var name: String {
        switch self {
        case .EUR: "Euro"
        case .USD: "US Dollar"
        case .AFN: "Afghani"
        case .ALL: "Lek"
        case .DZD: "Algerian Dinar"
        case .AOA: "Kwanza"
        case .ARS: "Argentine Peso"
        case .AMD: "Armenian Dram"
        case .AWG: "Aruban Florin"
        case .AUD: "Australian Dollar"
        case .AZN: "Azerbaijanian Manat"
        case .BSD: "Bahamian Dollar"
        case .BHD: "Bahraini Dinar"
        case .BDT: "Taka"
        case .BBD: "Barbados Dollar"
        case .BYN: "Belarussian Ruble"
        case .BZD: "Belize Dollar"
        case .BMD: "Bermudian Dollar"
        case .BTN: "Ngultrum"
        case .INR: "Indian Rupee"
        case .BOB: "Boliviano"
        case .BOV: "Mvdol"
        case .BAM: "Convertible Mark"
        case .BWP: "Pula"
        case .NOK: "Norwegian Krone"
        case .BRL: "Brazilian Real"
        case .BND: "Brunei Dollar"
        case .BGN: "Bulgarian Lev"
        case .BIF: "Burundi Franc"
        case .CVE: "Cabo Verde Escudo"
        case .KHR: "Riel"
        case .CAD: "Canadian Dollar"
        case .KYD: "Cayman Islands Dollar"
        case .CLF: "Unidad de Fomento"
        case .CLP: "Chilean Peso"
        case .CNY: "Yuan Renminbi"
        case .COP: "Colombian Peso"
        case .COU: "Unidad de Valor Real"
        case .KMF: "Comoro Franc"
        case .CDF: "Congolese Franc"
        case .NZD: "New Zealand Dollar"
        case .CRC: "Costa Rican Colon"
        case .CUC: "Peso Convertible"
        case .CUP: "Cuban Peso"
        case .CZK: "Czech Koruna"
        case .DKK: "Danish Krone"
        case .DJF: "Djibouti Franc"
        case .DOP: "Dominican Peso"
        case .EGP: "Egyptian Pound"
        case .SVC: "El Salvador Colon"
        case .ERN: "Nakfa"
        case .ETB: "Ethiopian Birr"
        case .FKP: "Falkland Islands Pound"
        case .FJD: "Fiji Dollar"
        case .GMD: "Dalasi"
        case .GEL: "Lari"
        case .GHS: "Ghana Cedi"
        case .GIP: "Gibraltar Pound"
        case .GTQ: "Quetzal"
        case .GBP: "Pound Sterling"
        case .GNF: "Guinea Franc"
        case .GYD: "Guyana Dollar"
        case .HTG: "Gourde"
        case .HNL: "Lempira"
        case .HKD: "Hong Kong Dollar"
        case .HUF: "Forint"
        case .ISK: "Iceland Krona"
        case .IDR: "Rupiah"
        case .IRR: "Iranian Rial"
        case .IQD: "Iraqi Dinar"
        case .ILS: "New Israeli Sheqel"
        case .JMD: "Jamaican Dollar"
        case .JPY: "Yen"
        case .JOD: "Jordanian Dinar"
        case .KZT: "Tenge"
        case .KES: "Kenyan Shilling"
        case .KPW: "North Korean Won"
        case .KRW: "Won"
        case .KWD: "Kuwaiti Dinar"
        case .KGS: "Som"
        case .LAK: "Kip"
        case .LBP: "Lebanese Pound"
        case .LSL: "Loti"
        case .ZAR: "Rand"
        case .LRD: "Liberian Dollar"
        case .LYD: "Libyan Dinar"
        case .CHF: "Swiss Franc"
        case .MOP: "Pataca"
        case .MGA: "Malagasy Ariary"
        case .MWK: "Kwacha"
        case .MYR: "Malaysian Ringgit"
        case .MVR: "Rufiyaa"
        case .MRU: "Ouguiya"
        case .MUR: "Mauritius Rupee"
        case .MXN: "Mexican Peso"
        case .MXV: "Mexican Unidad de Inversion"
        case .MDL: "Moldovan Leu"
        case .MNT: "Tugrik"
        case .MAD: "Moroccan Dirham"
        case .MZN: "Mozambique Metical"
        case .MMK: "Kyat"
        case .NAD: "Namibia Dollar"
        case .NPR: "Nepalese Rupee"
        case .NIO: "Cordoba Oro"
        case .NGN: "Naira"
        case .OMR: "Rial Omani"
        case .PKR: "Pakistan Rupee"
        case .PAB: "Balboa"
        case .PGK: "Kina"
        case .PYG: "Guarani"
        case .PEN: "Nuevo Sol"
        case .PHP: "Philippine Peso"
        case .PLN: "Zloty"
        case .QAR: "Qatari Rial"
        case .MKD: "Denar"
        case .RON: "Romanian Leu"
        case .RUB: "Russian Ruble"
        case .RWF: "Rwanda Franc"
        case .SHP: "Saint Helena Pound"
        case .WST: "Tala"
        case .STN: "Dobra"
        case .SAR: "Saudi Riyal"
        case .RSD: "Serbian Dinar"
        case .SCR: "Seychelles Rupee"
        case .SLE: "Leone"
        case .SGD: "Singapore Dollar"
        case .SBD: "Solomon Islands Dollar"
        case .SOS: "Somali Shilling"
        case .SSP: "South Sudanese Pound"
        case .LKR: "Sri Lanka Rupee"
        case .SDG: "Sudanese Pound"
        case .SRD: "Surinam Dollar"
        case .SZL: "Lilangeni"
        case .SEK: "Swedish Krona"
        case .CHE: "WIR Euro"
        case .CHW: "WIR Franc"
        case .SYP: "Syrian Pound"
        case .TWD: "New Taiwan Dollar"
        case .TJS: "Somoni"
        case .TZS: "Tanzanian Shilling"
        case .THB: "Baht"
        case .TOP: "Pa'anga"
        case .TTD: "Trinidad and Tobago Dollar"
        case .TND: "Tunisian Dinar"
        case .TRY: "Turkish Lira"
        case .TMT: "Turkmenistan New Manat"
        case .UGX: "Uganda Shilling"
        case .UAH: "Hryvnia"
        case .AED: "UAE Dirham"
        case .USN: "US Dollar (Next day)"
        case .UYI: "Uruguay Peso en Unidades Indexadas"
        case .UYU: "Peso Uruguayo"
        case .UZS: "Uzbekistan Sum"
        case .VUV: "Vatu"
        case .VEF: "Bolivar Fuerte"
        case .VED: "Bolivar"
        case .VND: "Dong"
        case .YER: "Yemeni Rial"
        case .ZMW: "Zambian Kwacha"
        case .ZWL: "Zimbabwe Dollar"
        }
    }
}
