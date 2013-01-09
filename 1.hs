import Data.Char

main = do 
  -- Translate the clue
  putStrLn $ translate 2 "g fmnc wms bgblr rpylqjyrc gr zw fylb. rfyrq ufyr amknsrcpq ypc dmp. bmgle gr gl zw fylb gq glcddgagclr ylb rfyr'q ufw rfgq rcvr gq qm jmle. sqgle qrpgle.kyicrpylq() gq pcamkkclbcb. lmu ynnjw ml rfc spj."
  -- Translate the URL
  putStrLn $ translate 2 "map"

translate :: Int -> [Char] -> [Char]
translate n phrase = map (translateChar n) phrase

translateChar :: Int -> Char -> Char
translateChar n x = chr $ (ord x) + (wrapOffset n x)

-- Don't translate punctuation and wrap offsets past 'z'
wrapOffset :: Int -> Char -> Int
wrapOffset n x
  | ord x > 122     = 0
  | ord x < 97      = 0
  | ord x + n > 122 = n - 26
  | otherwise       = n 
