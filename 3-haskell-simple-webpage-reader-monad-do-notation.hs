main :: IO ()
main = do
  putStrLn "what is your email address?"
  email <- getLine
  putStrLn . show $ runReader view email

view :: Reader Email Html
view = do
  page' <- page
  return $ div [ page' ]

page :: Reader Email Html
page = do
  content' <- content
  return $ div [ topNav , content' ]

topNav :: Html
topNav = div [ h1 [ "OurSite.com" ] ]

content :: Reader Email Html
content = do
  email <- ask
  right' <- right
  return $ div [ h1 [ "Custom Content for " ++ email ] , left , right' ]

left :: Html
left = div [ p [ "this is the left side" ] ]

right :: Reader Email Html
right = do
  article' <- article
  return $ div [ article' ]

article :: Reader Email Html
article = do
  widget' <- widget
  return $ div [ p [ "this is an article" ] , widget' ]

widget :: Reader Email Html
widget = do
  email <- ask
  return $ div [ p [ "Hey " ++ email ++ ", we've got a great offer for you!" ] ]
