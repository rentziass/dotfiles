local default_refile = '~/Dropbox/org/refile.org'

require('orgmode').setup_ts_grammar()
require('orgmode').setup({
  org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
  org_default_notes_file = default_refile,
  org_agenda_templates = {
    t = {
      description = 'TODO',
      template = '* TODO %?\n  DEADLINE: %t\n  %u',
      target = default_refile,
    },
    b = {
      description = 'GitHub Backlog',
      template = '** TODO %?\n   DEADLINE: %t\n   %u',
      target = default_refile,
      headline= 'GitHub Backlog',
    },
  },
})
