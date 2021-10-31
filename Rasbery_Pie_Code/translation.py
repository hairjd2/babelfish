from deep_translator import GoogleTranslator


if __name__ == "__main__":
    translated = GoogleTranslator(source='auto', target='de').translate("keep it up, you are awesome")  # output -> Weiter so, du bist großartig
    print(translated)