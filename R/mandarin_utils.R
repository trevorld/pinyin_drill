#' No audio
#' 
#' Gives error message and quits if no audio found
#' @return Never returns (quits)
#' @export
no_audio <- function(audio_dir) {
        cat("\nNo audio found in the directory", shQuote(audio_dir), "matching your request.  Did you forget to set the --audio_dir option?\n\n")
        quit('no')
}

#' Get input
#' 
#' Gets input from keyboard
#' @return String of input
#' @export
get_input <- function() { 
    con <- file("stdin")
    input <- tolower(readLines(con, 1))
    close(con)    
    if (input == "q") { quit('no') }
    input
}

#' Play media
#' 
#' Plays media file in vlc
#' @param media_file Filename to play
#' @return \code{invisible(NULL)}
#' @export
play_media <- function(media_file) {
    ans <- "r"
    cat("\nPress <ENTER> to reveal the answer, r<ENTER> to replay, or q<ENTER> to quit\n")
    while(ans == "r") {
        system(paste("cvlc --no-video --ignore-config --quiet --play-and-exit", shQuote(media_file), "2> /dev/null"))
        ans <- get_input()
    }
    invisible(NULL)
}

#' Print table
#' 
#' Plays table to terminal
#' @param df Data frame to print to terminal
#' @return \code{invisible(NULL)}
#' @export
print_table <- function(df) {
    cat(paste(names(df), collapse="\t"), "\n")
    for (ii in 1:nrow(df)) {
        cat(paste(df[ii,], collapse="\t"), "\n")
    }
}

replace_with_na <- function(x, index) { 
    if (ncol(x) < index) { return(rep(NA, nrow(x))) }
    ifelse(x[,index] == "", NA, x[,index])
}

#' Get filtered audio info from options
#'
#' This function returns a data frame of filtered audio info
#' @param opts A list of options
#' @return A data frame of filtered audio info
#' @export
get_filtered_audio_info <- function(opts) {
    t_initial <- tolower(str_split(opts$initial, ",", simplify=TRUE))
    t_final <- tolower(str_split(opts$final, ",", simplify=TRUE))
    t_tone <- tolower(str_split(opts$tone, ",", simplify=TRUE))
    t_pinyin <- tolower(str_split(opts$pinyin, ",", simplify=TRUE))
    t_initial1 <- tolower(str_split(opts$initial1, ",", simplify=TRUE))
    t_final1 <- tolower(str_split(opts$final1, ",", simplify=TRUE))
    t_tone1 <- tolower(str_split(opts$tone1, ",", simplify=TRUE))
    t_pinyin1 <- tolower(str_split(opts$pinyin1, ",", simplify=TRUE))
    t_initial2 <- tolower(str_split(opts$initial2, ",", simplify=TRUE))
    t_final2 <- tolower(str_split(opts$final2, ",", simplify=TRUE))
    t_tone2 <- tolower(str_split(opts$tone2, ",", simplify=TRUE))
    t_pinyin2 <- tolower(str_split(opts$pinyin2, ",", simplify=TRUE))
    t_initial3 <- tolower(str_split(opts$initial3, ",", simplify=TRUE))
    t_final3 <- tolower(str_split(opts$final3, ",", simplify=TRUE))
    t_tone3 <- tolower(str_split(opts$tone3, ",", simplify=TRUE))
    t_pinyin3 <- tolower(str_split(opts$pinyin3, ",", simplify=TRUE))
    t_initial4 <- tolower(str_split(opts$initial4, ",", simplify=TRUE))
    t_final4 <- tolower(str_split(opts$final4, ",", simplify=TRUE))
    t_tone4 <- tolower(str_split(opts$tone4, ",", simplify=TRUE))
    t_pinyin4 <- tolower(str_split(opts$pinyin4, ",", simplify=TRUE))
    t_nsyllables <- tolower(str_split(opts$nsyllables, ",", simplify=TRUE))
    t_filter <- opts$filter


    audio_info <- get_audio_info(opts$audio_dir)

    if (any(t_initial != '*')) { audio_info <- audio_info %>% filter(initial1 %in% t_initial | initial2 %in% t_initial | initial3 %in% t_initial | initial4 %in% t_initial) }
    if (any(t_final != '*')) { audio_info <- audio_info %>% filter(final1 %in% t_final | final2 %in% t_final | final3 %in% t_final | final4 %in% t_final) }
    if (any(t_tone != '*')) { audio_info <- audio_info %>% filter(tone1 %in% t_tone | tone2 %in% t_tone | tone3 %in% t_tone | tone4 %in% t_tone) }
    if (any(t_initial1 != '*')) { audio_info <- audio_info %>% filter(initial1 %in% t_initial1) }
    if (any(t_final1 != '*')) { audio_info <- audio_info %>% filter(final1 %in% t_final1) }
    if (any(t_tone1 != '*')) { audio_info <- audio_info %>% filter(tone1 %in% t_tone1) }
    if (any(t_initial2 != '*')) { audio_info <- audio_info %>% filter(initial2 %in% t_initial2) }
    if (any(t_final2 != '*')) { audio_info <- audio_info %>% filter(final2 %in% t_final2) }
    if (any(t_tone2 != '*')) { audio_info <- audio_info %>% filter(tone2 %in% t_tone2) }
    if (any(t_initial3 != '*')) { audio_info <- audio_info %>% filter(initial3 %in% t_initial3) }
    if (any(t_final3 != '*')) { audio_info <- audio_info %>% filter(final3 %in% t_final3) }
    if (any(t_tone3 != '*')) { audio_info <- audio_info %>% filter(tone3 %in% t_tone3) }
    if (any(t_initial4 != '*')) { audio_info <- audio_info %>% filter(initial4 %in% t_initial4) }
    if (any(t_final4 != '*')) { audio_info <- audio_info %>% filter(final4 %in% t_final4) }
    if (any(t_tone4 != '*')) { audio_info <- audio_info %>% filter(tone4 %in% t_tone4) }
    if (any(t_nsyllables != '*')) { audio_info <- audio_info %>% filter(n_syllables %in% t_nsyllables) }
    if (any(t_nsyllables != '*')) { audio_info <- audio_info %>% filter(n_syllables %in% t_nsyllables) }
    if (any(t_filter != '*')) { audio_info <- audio_info %>% filter(grepl(t_filter, audio)) }
    if (any(t_pinyin != '*')) { 
        gfilter <- paste(sapply(t_pinyin, py_expr), collapse="|")
        audio_info <- audio_info %>% filter(grepl(gfilter, pinyin))
    }
    if (any(t_pinyin1 != '*')) { 
        gfilter <- paste(sapply(t_pinyin1, py_expr), collapse="|")
        audio_info <- audio_info %>% filter(grepl(gfilter, pinyin1))
    }
    if (any(t_pinyin2 != '*')) {
        gfilter <- paste(sapply(t_pinyin2, py_expr), collapse="|")
        audio_info <- audio_info %>% filter(grepl(gfilter, pinyin2))
    }
    if (any(t_pinyin3 != '*')) {
        gfilter <- paste(sapply(t_pinyin3, py_expr), collapse="|")
        audio_info <- audio_info %>% filter(grepl(gfilter, pinyin3))
    }
    if (any(t_pinyin4 != '*')) {
        gfilter <- paste(sapply(t_pinyin4, py_expr), collapse="|")
        audio_info <- audio_info %>% filter(grepl(gfilter, pinyin4))
    }

    audio_info
}

py_expr <- function(py) {
    if (grepl("[[:digit:]]$", py)) {
        paste0("[^[:lower:]]+", py, "|^", py)
    } else {
        paste0("[^[:lower:]]+", py, "[^[:lower:]]+|^", py, "[^[:lower:]]+")
    }
}

#' Clean pinyin
#'
#' This function cleans pinyin
#' @param pinyin String of pseduo-pinyin to clean up.
#' @return A string.
#' @export
clean_pinyin <- function(pinyin) {
    pinyin <- gsub("eh", "ê", pinyin)
    pinyin <- system(paste("cjknife", "-m", pinyin), intern=TRUE)
    pinyin
}

#' Get IPA
#'
#' This function gets IPA pronunciation
#' @param String of pinyin to get pronunciation of.
#' @return A string.
#' @export
get_ipa <- function(pinyin) {
    pinyin <- gsub("eh", "ê", pinyin)
    ipa <- system(paste("cjknife", "-s Pinyin", "-t MandarinIPA", "-m", pinyin), intern=TRUE)
}

get_files <- function(audio_dir) {
    # list.files(audio_dir) # Weird error "'translateCharUTF8' must be called on a CHARSXP"
    system(paste("find", shQuote(audio_dir), "-type f"), intern=TRUE)
}

get_audio_info <- function(audio_dir) {

    if_table <- mandarin_pinyin_mappings

    files <- get_files(audio_dir)
    files <- grep(".txt$|.md$|.rst$", files, value=TRUE, invert=TRUE)
    pinyin <- gsub("(.*)\\..*", "\\1", basename(files))
    pinyin <- str_split(pinyin, '_', n=2, simplify=TRUE)[,1]
    pinyin <- gsub("'", "", tolower(pinyin))
    if (length(pinyin) == 0) {
        no_audio(audio_dir)
    }

    alphas <- str_split(pinyin, '[[:digit:]]', simplify=TRUE)
    alpha1 <- alphas[,1]
    alpha2 <- replace_with_na(alphas,2)
    alpha3 <- replace_with_na(alphas,3)
    alpha4 <- replace_with_na(alphas,4)

    tones <- str_split(pinyin, '[[:lower:]]+', simplify=TRUE)
    tone1 <- tones[,1+1]
    tone2 <- replace_with_na(tones,2+1)
    tone3 <- replace_with_na(tones,3+1)
    tone4 <- replace_with_na(tones,4+1)

    pinyin1 <- paste0(alpha1, tone1)
    pinyin2 <- ifelse(is.na(alpha2), NA, paste0(alpha2, tone2))
    pinyin3 <- ifelse(is.na(alpha3), NA, paste0(alpha3, tone3))
    pinyin4 <- ifelse(is.na(alpha4), NA, paste0(alpha4, tone4))

    n_syllables <- str_count(pinyin, "[[:digit:]]")

    if1 <- left_join(data.frame(ascii=alpha1, stringsAsFactors=FALSE), if_table, by='ascii')
    initial1 <- if1$initial
    final1 <- if1$final

    if2 <- left_join(data.frame(ascii=as.character(alpha2), stringsAsFactors=FALSE), if_table, by='ascii')
    initial2 <- if2$initial
    final2 <- if2$final

    if3 <- left_join(data.frame(ascii=as.character(alpha3), stringsAsFactors=FALSE), if_table, by='ascii')
    initial3 <- if3$initial
    final3 <- if3$final

    if4 <- left_join(data.frame(ascii=as.character(alpha4), stringsAsFactors=FALSE), if_table, by='ascii')
    initial4 <- if4$initial
    final4 <- if4$final

    deconstruction1 <- paste0(initial1, '-', final1)
    deconstruction2 <- ifelse(is.na(initial2), '', paste0(initial2, '-', final2))
    deconstruction3 <- ifelse(is.na(initial3), '', paste0(initial3, '-', final3))
    deconstruction4 <- ifelse(is.na(initial4), '', paste0(initial4, '-', final4))
    deconstruction5 <- ifelse(n_syllables > 4, "...", "")
    deconstruction <- paste(deconstruction1, deconstruction2, deconstruction3, 
                            deconstruction4, deconstruction5)

    audio_info <- data.frame(pinyin, deconstruction,
                            initial1, final1, tone1, pinyin1,
                            initial2, final2, tone2, pinyin2,
                            initial3, final3, tone3, pinyin3,
                            initial4, final4, tone4, pinyin4,
                            n_syllables, audio=files, stringsAsFactors=FALSE)
}
