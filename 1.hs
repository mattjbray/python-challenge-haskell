import Data.Char

main = do 
  putStrLn $ translate 2 "g fmnc wms bgblr rpylqjyrc gr zw fylb. rfyrq ufyr amknsrcpq ypc dmp. bmgle gr gl zw fylb gq glcddgagclr ylb rfyr'q ufw rfgq rcvr gq qm jmle. sqgle qrpgle.kyicrpylq() gq pcamkkclbcb. lmu ynnjw ml rfc spj."
  putStrLn $ translate 2 "map"

offsetChr :: Int -> Char -> Char
offsetChr n x = chr $ (ord x) + (wrapOffset n x)

wrapOffset :: Int -> Char -> Int
wrapOffset n x
  | ord x > 122     = 0
  | ord x < 97      = 0
  | ord x + n > 122 = n - 26
  | otherwise       = n 

translate :: Int -> [Char] -> [Char]
translate n phrase = map (offsetChr n) phrase
