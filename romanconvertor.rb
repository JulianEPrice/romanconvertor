def fromRoman(romanNumber)
    @roman_numerals = [
        ["M"  , 1000],
        ["CM" , 900],
        ["D"  , 500],
        ["CD" , 400],
        ["C"  , 100],
        ["XC" ,  90],
        ["L"  ,  50],
        ["XL" ,  40],
        ["X"  ,  10],
        ["IX" ,   9],
        ["V"  ,   5],
        ["IV" ,   4],
        ["I"  ,   1]
    ]
    romanNumberDup = romanNumber.dup
    raise TypeError if /^[^IVXLCDM]+$/.match(romanNumberDup).nil? == false
    arabic = 0
    @roman_numerals.each { |key, value|
        while romanNumberDup.index(key) == 0
            arabic += value
            romanNumberDup.slice!(key)
        end
    }
    arabic
end

def toRoman(arabicNumber)
    raise RangeError if arabicNumber <= 0 || arabicNumber >= 4000
    roman = ''
    @roman_numerals = [
        ["M"  , 1000],
        ["CM" , 900],
        ["D"  , 500],
        ["CD" , 400],
        ["C"  , 100],
        ["XC" ,  90],
        ["L"  ,  50],
        ["XL" ,  40],
        ["X"  ,  10],
        ["IX" ,   9],
        ["V"  ,   5],
        ["IV" ,   4],
        ["I"  ,   1]
    ]
    @roman_numerals.each do |arabic_key, roman_numeral|
        roman << arabic_key * (arabicNumber / roman_numeral)
        arabicNumber %= roman_numeral
    end
    roman
end