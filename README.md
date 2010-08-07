# Teambox Translations

Initial setup:

1. Clone this repository <code>git clone git://github.com/dz0ny/teambox-translations.git</code>
2. Go to directory and run <code>rake translate:init</code> 
3. Make fork of Teambox on Github and run <code>rake translate:clone["forked repository url"]</code> or <code>rake translate:clone</code> iy you want to clone main repository
4. Pull the translation you want to update using <code>rake translate:pull["de"]</code> 
5. Run server <code>script/server</code> 

After you done translating:

1. Push changes back to your fork <code>rake translate:push</code>  

Updating to latest changes:

1. Pull the translation you want to update using <code>rake translate:pull["fr"]</code>  
2. Run server <code>script/server</code> 

If you want to start from beginning <code>rake translate:reset</code> 