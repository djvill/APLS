# Site outline

This is just a sketch!

- Homepage
	
	Brief description of APLS and what it can do, pointers to other pages on the site.
	Think of this as the "elevator pitch" for APLS.
	While APLS is under construction, include some text about how it's in-progress, but you can still request a login

- How to use
	
	Overview: registering an account, basic functionalities, basic organizational ideas (transcript, participant, layer), navigation, citing & contributing back
	
	These pages are kind of a hybrid between a manual and a tutorial.
	They'll include "Try it!" [callouts](https://just-the-docs.com/docs/ui-components/callouts/) that are [configured](https://github.com/just-the-docs/just-the-docs/blob/main/_includes/css/callouts.scss.liquid) to be collapsible, something like the following (but with JS to shunt the contents into a `<details>` node and SCSS to make `<summary>` look like `blockquote.important::before`)
	
		```html
		<blockquote class="try-it">
			<details open>
				<summary>Try it!</summary>
				<p>Follow these steps:</p>
				<ol><li>Log on</li></ol>
			</details>
		</blockquote>
		```
	
	- Signing up for APLS
		
		I'm not sure this needs to be a page, because there's a link to the form on the nav footer already.
		The "Overview" page can just link straight to the form.
	
	- Viewing a transcript
	
		- Downloading an entire transcript
		
		- Viewing transcript fragments in Praat
	
	- Searching the corpus
		
		Including assorted tips
		
		- Regex
	
	- Browsing participants
		
		Including _upload_ > _extract participant data_
	
	- Exporting data
		
		Covers both _search_ > export options and _upload_ > export options
	
	- Extracting acoustic measurements
	
	- Looking up dictionary entries
	
	- Layer reference
		
		Terms (scope, parallel annotations), table, flowchart(s).
		
		This could even potentially be a level-1 section.
		
	- Citing APLS
		
		Or "Citing and contributing back"
		
		This page might make more sense in "About", depending on how you divide the pie between "How to use" & "About".
		If "How to use" is LaBB-CAT & "About" is LaBB-CAT-external, then this page should be in "About".
		But if "How to use" is about workflow, then this page belongs in "How to use", because I want users to think of citing APLS as just the final step in the workflow.
		
		Citation should include a dropdown menu to select a version, which auto-updates the BibTeX and formatted cite.
		
		I guess if it's just a citation page, then it should be in "About".
		But if it includes contributing back, then it makes more sense in "How to use"
	
	- Troubleshooting
		
		This can be a catch-all page, with links to explanations on other pages if needed (e.g., if your search isn't working, check out the search tips first)

- Transcription
	
	This is a bit of an orphan as its own level-1 section, but I don't want to clog up "About" with more stuff
	
	- Custom dictionary
		
		Move from `/files/` to `/docs/`
	
- About APLS
	
	- Credits
		
		Both contributors and software.
		Though for a lot of software, I can refer users to https://apls.pitt.edu/labbcat/credits.
	
	- Data sources
	
	- Version history
	
	- Glossary
		
		This could potentially be a level-1 section.
	
	- Terms of use
		
		This could potentially be a level-1 section.
