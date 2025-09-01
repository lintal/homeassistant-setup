.PHONY: copy-custom-components clean

dist: copy-custom-components

copy-custom-components:
	@find ./apps -type d -name custom_components | while read dir; do \
		app_name=$$(basename $$(dirname $$dir)); \
		mkdir -p ./dist/custom_components; \
		cp -r $$dir/* ./dist/custom_components/; \
	done
	rm ./dist/custom_components/__init__.py || true

clean:
	rm -Rf ./dist/custom_components || true