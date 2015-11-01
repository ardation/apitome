Apitome::Engine.routes.draw do
  root to: "docs#index"
  get "/simulate/*path", to: "docs#simulate"
  get "/pages/:topic/:file", to: "pages#show"
  get "/*path", to: "docs#show"
end
