---
synced:
  attribute: transcription_ai_tools
  display_title: Transcription AI tool(s)
  parent: transcript
  multi_select: yes
  valid_labels:
    - - label: Batchalign transcription
        description: Orthographic transcription using Batchalign 1 (https://github.com/TalkBank/batchalign)
          based on rev.ai model, with some post-processing
      - label: CLOx transcription
        description: Orthographic transcription using CLOx (https://clox.ling.washington.edu/#/)
      - label: Batchalign segmentation
        description: Turn segmentation using Batchalign 1 (https://github.com/TalkBank/batchalign)
          based on rev.ai model.
      - label: Pyannote segmentation
        description: Turn segmentation using pyannote (https://github.com/pyannote/pyannote-audio),
          with some post-processing
  data_type: select
  short_description: AI tool(s) used to assist human transcription
  display_order: 108
  filterable: no
  access: yes
  attrib_type: transcript
  transcripts_exportable: yes
  attrib_page_viewable: transcript
  matches_exportable: yes
  export_includeCounts: yes
last_sync_modified_date: 2025-02-17T14:18:55-0500
last_modified_date: 2025-02-17T14:20:04-05:00
---
