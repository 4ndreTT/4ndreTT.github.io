#comando para iniciar el servidor de jekyll	

bundler exec jekyll build && bash -c 'cd _site && python3 -m http.server 3000'
