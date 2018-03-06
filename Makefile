node_modules/@financial-times/n-gage/index.mk:
	npm install --no-save @financial-times/n-gage
	touch $@

-include node_modules/@financial-times/n-gage/index.mk

demo-build:
	@rm -rf bower_components/n-article-ribbon
	@mkdir bower_components/n-article-ribbon
	@cp -r templates/ bower_components/n-article-ribbon/templates/
	@node-sass demos/src/main.scss public/main.css --include-path bower_components
	@$(DONE)

demo: demo-build
	@node demos/app

a11y: demo-build
	@node .pa11yci.js
	@PA11Y=true node demos/app
	@$(DONE)

unit-test:

test: verify unit-test a11y
