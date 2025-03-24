---
synced:
  attribute: transcription_ai_tools
  display_title: Transcription AI tool(s)
  parent: transcript
  multi_select: yes
  valid_labels:
    - - label: Batchalign segmentation
        description: Turn segmentation using Batchalign 1 (https://github.com/TalkBank/batchalign)
          based on rev.ai model.
      - label: Batchalign transcription
        description: Orthographic transcription using Batchalign 1 (https://github.com/TalkBank/batchalign)
          based on rev.ai model, with some post-processing
      - label: CLOx transcription
        description: Orthographic transcription using CLOx (https://clox.ling.washington.edu/#/)
      - label: Pyannote segmentation
        description: Turn segmentation using pyannote (https://github.com/pyannote/pyannote-audio),
          with some post-processing
  data_type: select
  short_description: AI tool(s) used to assist human transcription
  display_order: 107
  filterable: no
  access: yes
  attrib_type: transcript
  transcripts_exportable: yes
  attrib_page_viewable: transcript
  matches_exportable: yes
  export_includeCounts: yes
last_sync_modified_date: 2025-03-24T12:51:03-0400
last_modified_date: 2025-03-24T12:51:56-04:00
---

{: .note .no-collapse }
> For more context on how transcriptions were created, see [here]({{ '/doc/transcription' | relative_url }}).
