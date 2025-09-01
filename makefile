.PHONY: update-deps copy-custom-components clean

dist: clean update-deps copy-custom-components

update-deps:
	@echo "Updating git submodules..."
	@git pull --recurse-submodules
	@echo "Submodules updated."

copy-custom-components:
	@find ./apps -type d -name custom_components | while read dir; do \
		app_name=$$(basename $$(dirname $$dir)); \
		mkdir -p ./dist/custom_components; \
		cp -r $$dir/* ./dist/custom_components/; \
	done
	@rm ./dist/custom_components/__init__.py || true

clean:
	@rm -Rf ./dist/custom_components || true