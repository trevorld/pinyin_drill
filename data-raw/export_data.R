library("dplyr")
read_csv <- function(x) { 
    utils::read.csv(x, stringsAsFactors=FALSE, encoding="UTF-8") 
}

mandarin_initials <- read_csv("data-raw/initial.csv")
save(mandarin_initials, file="data/mandarin_initials.rda", compress=TRUE)
initial <- select(mandarin_initials, initial, i.ipa = ipa, i.bopomofo = bopomofo)

mandarin_finals <- read_csv("data-raw/final.csv")
save(mandarin_finals, file="data/mandarin_finals.rda", compress=TRUE)
final <- select(mandarin_finals, final, f.ipa = ipa, f.bopomofo = bopomofo)

mandarin_pinyin_mappings <- read_csv("data-raw/pinyin_initial_final.csv")

mandarin_pinyin_mappings <- left_join(mandarin_pinyin_mappings, initial, by="initial")


mandarin_pinyin_mappings <- left_join(mandarin_pinyin_mappings, final, by="final")

mandarin_pinyin_mappings <- mutate(mandarin_pinyin_mappings, ipa = paste0(i.ipa, f.ipa),
                                  bopomofo = paste0(i.bopomofo, f.bopomofo))

save(mandarin_pinyin_mappings, file="data/mandarin_pinyin_mappings.rda", compress=TRUE)
