# Uzbek Transliterator Package Ideas

## Overview
A blueprint for building a production-ready, bidirectional Uzbek transliterator package (Latin ↔ Cyrillic) in Dart/Flutter. Currently, many existing packages lack robust bidirectional support, specifically failing on complex contextual rules and apostrophe handling. This document serves as a guide for building a flawless standalone package in the future.

## Known Edge Cases & Solutions

### 1. Cyrillic to Latin (The Harder Direction)
- **The Letter Е (Ye / E):**
  - *Rule:* Maps to `Ye` at the beginning of a word (Европа -> Yevropa) or after a vowel. Maps to `e` after a consonant (Келди -> Keldi).
- **The Letter Э (E):**
  - *Rule:* Always maps to `E` in Latin (Эртага -> Ertaga, Аэропорт -> Aeroport).
- **The Letter Ц (S / Ts):**
  - *Rule:* Maps to `S` at the beginning of a word (Цирк -> Sirk, Цех -> Sex). Maps to `Ts` in the middle or end of a word (Конституция -> Konstitutsiya).
- **Hard & Soft Signs (Ъ, Ь):**
  - *Rule:* `Ъ` (Tverdiy Znak) maps to an apostrophe `'` in Latin (Маълумот -> Ma'lumot). `Ь` (Myagkiy Znak) is generally dropped in modern standard Uzbek Latin (Сентябрь -> Sentyabr).
- **Capitalization:**
  - *Rule:* If the source word is fully capitalized (ШАРҚ), digraphs like `Ш` must map to `SH`, not `Sh` (SHARQ, not ShARQ).

### 2. Latin to Cyrillic
- **Digraphs (O', G', Sh, Ch):**
  - *Rule:* Must map as single Cyrillic characters (Ў, Ғ, Ш, Ч). Crucially, the logic must handle all common variations of apostrophes/quotes (e.g., `O'`, `O‘`, `Oʻ`) mapping them universally to `Ў`.
- **Apostrophes (Tutuq Belgisi):**
  - *Rule:* Any standalone apostrophe (`'`, `‘`) that is *not* part of an `O'` or `G'` must map to `ъ` (Ma'lumot -> Маълумот, Mas'uliyat -> Масъулият).
- **Ya, Yu, Yo (Я, Ю, Ё):**
  - *Rule:* Multi-character Latin sounds map to a single Cyrillic letter.
- **The Letter E (Э / Е):**
  - *Rule:* `E` at the beginning of a word maps to `Э` (Ertaga -> Эртага). `E` in the middle of a word maps to `Е` (Keltir -> Келтир). `Ye` always maps to `Е` (Yelka -> Елка).

### 3. Edge Cases in Real-World Text
- **Punctuation & Quotes:** Ensure apostrophes inside English quotes or possessives (e.g., "John's car") don't accidentally get converted to `ъ`. This might require strict word-boundary matching.
- **Acronyms:** Ensure acronyms (e.g., AQSH -> АҚШ, BMT -> БМТ) retain correct capitalization across the entire word.

## Suggested Technical Architecture
1. **Regex-First Approach:** Use Regular Expressions to target position-specific rules (e.g., `\bE` for `E` at the start of a word).
2. **API Design:** Expose a simple static class `UzbekTransliterator` with `toCyrillic(String text)` and `toLatin(String text)`.
3. **Test-Driven Development:** Write a comprehensive unit test suite covering every edge case listed above before writing the core logic.
