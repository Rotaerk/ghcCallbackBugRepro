module Main where

import Data.Word
import Foreign.Ptr

main :: IO ()
main = do
  callbackPtr <- wrapCallback $ \p1 p2 p3 p4 p5 p6 p7 p8 -> do
    putStrLn $ "P1: " ++ show p1
    putStrLn $ "P2: " ++ show p2
    putStrLn $ "P3: " ++ show p3
    putStrLn $ "P4: " ++ show p4
    putStrLn $ "P5: " ++ show p5
    putStrLn $ "P6: " ++ show p6
    putStrLn $ "P7: " ++ show p7
    putStrLn $ "P8: " ++ show p8
    return (p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8)
  result <- callMe callbackPtr
  putStrLn $ "Result: " ++ show result

type DynamicWrapper f = f -> IO (FunPtr f)
type Callback = Word64 -> Word64 -> Word64 -> Word64 -> Word64 -> Word64 -> Word64 -> Word64 -> IO Word64

foreign import ccall "callMe" callMe :: FunPtr Callback -> IO Word64
foreign import ccall "wrapper" wrapCallback :: DynamicWrapper Callback
