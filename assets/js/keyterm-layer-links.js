/* keyterm-layer-links.js
   
   Turn keyterm/layer <span>s into links by adding <a> child
   
   !!TODO:
   For keyterms, facilitate "In context" backlinks (in doc/glossary) by adding
   keyterm-<TERM> ID to:
   - The token of <TERM> with class term-anchor (if any), OR
   - The first token of <TERM> (if none are .term-anchor)
   This facilitates pointing the backlink to a specific token.
   If >1 token of <TERM> is .term-anchor, an error is thrown
*/

function addA(node, type) {
  //Create new <a> as child of node and move text to <a>
  var nodeText = node.innerText,
      a = document.createElement("a");
  a.innerText = nodeText;
  node.innerText = '';
  node.appendChild(a);
  
  //Normalize name
  var hrefName = nodeText.replaceAll(" ", "-").toLowerCase();
  //Add href depending on type
  if (type === "keyterm") {
    var page = "/APLS/doc/glossary";
    //For keyterms, also de-pluralize
    hrefName = hrefName.replace(/s$/, '');
    // a.href = page + "#" + hrefName;
  } else if (type === "layer") {
    //For layers, don't add a href or title if it's an h2 *on* the field-guide page
    //(but keep the <a> for consistency w/rt stylesheets)
    var page = "/APLS/doc/detailed-field-guide";
    if (!(location.href.endsWith(page) && node.parentElement.nodeName == "H2")) {
      a.href = page + "#" + hrefName;
      
      //BEGIN generated by /_layers/sync-layers.R
      var title;
      switch (hrefName) {
        case 'word':
          title = `The word as originally transcribed, including pause/question markers`;
          break;
        case 'segment':
          title = `Individual speech sound`;
          break;
        case 'orthography':
          title = `The word in lowercase letters (without pause markers)`;
          break;
        case 'part_of_speech':
          title = `The word's part(s) of speech`;
          break;
        case 'lemma':
          title = `All possible base forms of the word`;
          break;
        case 'frequency_from_celex':
          title = `How often the current word appears in the CELEX English reference corpus`;
          break;
        case 'frequency_in_corpus':
          title = `How often the current word appears in 'interview' and 'metalinguistic' transcripts`;
          break;
        case 'morphemes':
          title = `All possible ways to break down the current word into morphemes`;
          break;
        case 'phonemes':
          title = `Sequence of speech sounds in the word`;
          break;
        case 'stress':
          title = `Syllable stresses in the word`;
          break;
        case 'dictionary_phonemes':
          title = `All possible phonemic representations of the word`;
          break;
        case 'syllables':
          title = `Syllables in the word, including stress, derived from aligned segments`;
          break;
        case 'foll_segment':
          title = `Segment or pause following the current segment`;
          break;
        case 'turn':
          title = `Series of uninterrupted utterances from the same speaker`;
          break;
        case 'utterance':
          title = `Line in the transcript`;
          break;
        case 'overlap':
          title = `Whether or not there is more than one speaker speaking in this turn`;
          break;
        case 'foll_pause':
          title = `Duration of pause (in seconds) following the current word`;
          break;
        case 'speech_rate':
          title = `Measurement of syllables per second for this utterance (line), skipping over pauses`;
          break;
        case 'lexical':
          title = `A lexical annotation supplied manually for this word`;
          break;
        case 'pronounce':
          title = `A pronunciation annotation supplied manually for this word`;
          break;
        case 'comment':
          title = `Comments about speech created by original transcribers`;
          break;
        case 'noise':
          title = `Non-speech noises (human or otherwise)`;
          break;
        case 'redaction':
          title = `Speech redacted from the transcript (e.g., personally identifying information)`;
          break;
        case 'language':
          title = `Language spoken (placeholder)`;
          break;
        case 'htk':
          title = `HTK alignment time`;
          break;
        case 'orthography_no_clitic':
          title = `The word in all lowercase letters, after removing all clitics`;
          break;
        case 'phonemes_no_clitic':
          title = `All possible phonemic representations of the word, after removing all clitics`;
          break;
        case 'ipa_phonemes':
          title = `IPA phonemes`;
          break;
        case 'mfa_phonemes':
          title = `All possible phonemic representations of the word, translated to Montreal Forced Aligner US English IPA phoneset`;
          break;
        case 'corpus':
          title = `(none)`;
          break;
        case 'episode':
          title = `(none)`;
          break;
        case 'main_participant':
          title = `(none)`;
          break;
        case 'participant':
          title = `(none)`;
          break;
        case 'transcript':
          title = `(none)`;
          break;
        case 'transcript_type':
          title = `(none)`;
          break;
        case 'transcript_neighborhood':
          title = `Which neighborhood main speaker was recruited from (note that Pittsburghers often refer to municipalities near Pittsburgh as "neighborhoods")`;
          break;
        case 'transcript_language':
          title = `Language spoken (placeholder)`;
          break;
        case 'transcript_version_date':
          title = `Date the transcript was last edited`;
          break;
        case 'transcript_transcribers':
          title = `Name of transcriber(s) who completed the original orthographic transcription`;
          break;
        case 'transcript_recording_date':
          title = `Date of recording`;
          break;
        case 'transcript_duration':
          title = `Transcript duration in seconds`;
          break;
        case 'transcript_transcription_ai_tools':
          title = `AI tool(s) used to assist human transcription`;
          break;
        case 'transcript_notes':
          title = `General notes that help contextualize the transcript`;
          break;
        case 'participant_neighborhood':
          title = `Which neighborhood speaker was recruited from (note that Pittsburghers often refer to municipalities near Pittsburgh as "neighborhoods")`;
          break;
        case 'participant_gender':
          title = `Gender identity`;
          break;
        case 'participant_year_of_birth':
          title = `Year of birth`;
          break;
        case 'participant_education':
          title = `Five-way classification of highest educational attainment`;
          break;
        case 'participant_occupation':
          title = `Four-way classification of occupation`;
          break;
        case 'participant_type':
          title = `Whether a participant is a main speaker (interviewee), interviewer, or bystander.`;
          break;
        case 'participant_ethnicities':
          title = `Ethnic/racial self-identification`;
          break;
        case 'participant_transcript_duration':
          title = `Total duration of transcripts (in seconds) for which this is the main speaker (not total speaking time)`;
          break;
        case 'participant_neighborhood_childhood':
          title = `Childhood neighborhood/municipality (narrow)`;
          break;
        case 'participant_neighborhood_current':
          title = `Neighborhood/municipality at time of interview (narrow)`;
          break;
        case 'participant_relationships':
          title = `Relationships to other speakers`;
          break;
        case 'participant_speech_rate':
          title = `Measurement of syllables per second, skipping over pauses, across all of this speaker's aligned utterances`;
          break;
      }
      a.title = title;
      //END generated by /_layers/sync-layers.R
    }
  }
}


//Add anchors once page loads
window.addEventListener('DOMContentLoaded', () => {
  var keyterms = document.querySelectorAll("span.keyterm"),
      layers = document.querySelectorAll("span.layer");
  keyterms.forEach(a => addA(a, "keyterm"));
  layers.forEach(a => addA(a, "layer"));
});

