#' Mandarin Finals
#'
#' A Dataset of Mandarin Finals
#'
#' @format A data frame with six columns:

#'   * final An unique ASCII final
#'   * pinyin Final in Hanyu Pinyin
#'   * ipa Final in Mandarin IPA
#'   * bopomofo Final in Bopomofo (Zhuyin)
#'   * example Simplified character example of final
#'   * note Extra notes on final
#'     
#' @source Compiled manually by author from https://en.wikipedia.org/wiki/Pinyin, https://en.wikipedia.org/wiki/Erhua, and https://en.wikipedia.org/wiki/Bopomofo
"mandarin_finals"

#' Mandarin Initials
#'
#' A Dataset of Mandarin Initials
#'
#' @format A data frame with five columns:

#'   * initial Initial in ASCII/Pinyin
#'   * ipa Initial in Mandarin IPA
#'   * bopomofo Initial in Bopomofo (Zhuyin)
#'   * example Simplified character example of initial
#'   * note Extra notes on initial
#'
#' @source Compiled manually by author from https://en.wikipedia.org/wiki/Pinyin and https://en.wikipedia.org/wiki/Bopomofo
"mandarin_initials"

#' Pinyin Mappings
#'
#' A Dataset of Mappings from Pinyin to other Formats
#'
#' @format A data frame with three columns:
#'
#'    * ascii Ascii-fied Pinyin syllable
#'    * initial Mandarin initial
#'    * final Mandarin final
#'    
#' @source Compiled manually by author
"mandarin_pinyin_mappings"
