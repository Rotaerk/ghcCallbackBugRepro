module Main where

import Data.Int
import Data.Word
import Foreign.C.String
import Foreign.Ptr

main :: IO ()
main = do
  all64Ptr <- wrapAll64 $ \p1 p2 p3 p4 p5 p6 p7 p8 -> do
    putStrLn "Callback with only 64-bit parameters..."
    putStrLn $ "P1: " ++ show p1
    putStrLn $ "P2: " ++ show p2
    putStrLn $ "P3: " ++ show p3
    putStrLn $ "P4: " ++ show p4
    putStrLn $ "P5: " ++ show p5
    putStrLn $ "P6: " ++ show p6
    putStrLn $ "P7: " ++ show p7
    putStrLn $ "P8: " ++ show p8
  one32Ptr <- wrapOne32 $ \p1 p2 p3 p4 p5 p6 p7 p8 -> do
    putStrLn "Callback with one 32-bit parameter and the rest 64-bit..."
    putStrLn $ "P1: " ++ show p1
    putStrLn $ "P2: " ++ show p2
    putStrLn $ "P3: " ++ show p3
    putStrLn $ "P4: " ++ show p4
    putStrLn $ "P5: " ++ show p5
    putStrLn $ "P6: " ++ show p6
    putStrLn $ "P7: " ++ show p7
    putStrLn $ "P8: " ++ show p8
  two32Ptr <- wrapTwo32 $ \p1 p2 p3 p4 p5 p6 p7 p8 -> do
    putStrLn "Callback with two 32-bit parameters and the rest 64-bit..."
    putStrLn $ "P1: " ++ show p1
    putStrLn $ "P2: " ++ show p2
    putStrLn $ "P3: " ++ show p3
    putStrLn $ "P4: " ++ show p4
    putStrLn $ "P5: " ++ show p5
    putStrLn $ "P6: " ++ show p6
    putStrLn $ "P7: " ++ show p7
    putStrLn $ "P8: " ++ show p8
  callMe all64Ptr one32Ptr two32Ptr
  freeHaskellFunPtr all64Ptr
  freeHaskellFunPtr one32Ptr
  freeHaskellFunPtr two32Ptr

type DynamicWrapper f = f -> IO (FunPtr f)
type All64 = Word64 -> Word64 -> Word64 -> Word64 -> Word64 -> Word64 -> Word64 -> Word64 -> IO ()
type One32 = Word64 -> Word64 -> Word32 -> Word64 -> Word64 -> Word64 -> Word64 -> Word64 -> IO ()
type Two32 = Word64 -> Word32 -> Word32 -> Word64 -> Word64 -> Word64 -> Word64 -> Word64 -> IO ()

foreign import ccall "callMe" callMe :: FunPtr All64 -> FunPtr One32 -> FunPtr Two32 -> IO ()
foreign import ccall "wrapper" wrapAll64 :: DynamicWrapper All64
foreign import ccall "wrapper" wrapOne32 :: DynamicWrapper One32
foreign import ccall "wrapper" wrapTwo32 :: DynamicWrapper Two32
