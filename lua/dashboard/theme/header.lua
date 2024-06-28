local api = vim.api
local utils = require('dashboard.utils')

local function week_ascii_text()
  return {
    ['Monday'] = {
      '',
      '',
      '██████╗   ██████╗  ███╗   ███╗  █████╗  ██████╗  ███████╗  ██████╗ ',
      '██╔══██╗ ██╔═══██╗ ████╗ ████║ ██╔══██╗ ██╔══██╗ ██╔════╝ ██╔═══██╗',
      '██████╔╝ ██║   ██║ ██╔████╔██║ ███████║ ██████╔╝ █████╗   ██║   ██║',
      '██╔══██╗ ██║   ██║ ██║╚██╔╝██║ ██╔══██║ ██╔══██╗ ██╔══╝   ██║   ██║',
      '██║  ██║ ╚██████╔╝ ██║ ╚═╝ ██║ ██║  ██║ ██║  ██║ ███████╗ ╚██████╔╝',
      '╚═╝  ╚═╝  ╚═════╝  ╚═╝     ╚═╝ ╚═╝  ╚═╝ ╚═╝  ╚═╝ ╚══════╝  ╚═════╝ ',
      '',
      "Good day! It's Monday.",
      '',
      "Don't forget to be awesome. Even if you have to fake it until you make it!",
      '',
      '',
      '',
      '',
    },
    ['Tuesday'] = {
      '',
      '',
      '██████╗   ██████╗  ███╗   ███╗  █████╗  ██████╗  ███████╗  ██████╗ ',
      '██╔══██╗ ██╔═══██╗ ████╗ ████║ ██╔══██╗ ██╔══██╗ ██╔════╝ ██╔═══██╗',
      '██████╔╝ ██║   ██║ ██╔████╔██║ ███████║ ██████╔╝ █████╗   ██║   ██║',
      '██╔══██╗ ██║   ██║ ██║╚██╔╝██║ ██╔══██║ ██╔══██╗ ██╔══╝   ██║   ██║',
      '██║  ██║ ╚██████╔╝ ██║ ╚═╝ ██║ ██║  ██║ ██║  ██║ ███████╗ ╚██████╔╝',
      '╚═╝  ╚═╝  ╚═════╝  ╚═╝     ╚═╝ ╚═╝  ╚═╝ ╚═╝  ╚═╝ ╚══════╝  ╚═════╝ ',
      '',
      "Good day! It's Tuesday.",
      '',
      'you’re one day closer to the weekend. Keep going,',
      'and may your coffee be strong and your day be short.',
      '',
      '',
      '',
      '',
    },
    ['Wednesday'] = {
      '',
      '',
      '██████╗   ██████╗  ███╗   ███╗  █████╗  ██████╗  ███████╗  ██████╗ ',
      '██╔══██╗ ██╔═══██╗ ████╗ ████║ ██╔══██╗ ██╔══██╗ ██╔════╝ ██╔═══██╗',
      '██████╔╝ ██║   ██║ ██╔████╔██║ ███████║ ██████╔╝ █████╗   ██║   ██║',
      '██╔══██╗ ██║   ██║ ██║╚██╔╝██║ ██╔══██║ ██╔══██╗ ██╔══╝   ██║   ██║',
      '██║  ██║ ╚██████╔╝ ██║ ╚═╝ ██║ ██║  ██║ ██║  ██║ ███████╗ ╚██████╔╝',
      '╚═╝  ╚═╝  ╚═════╝  ╚═╝     ╚═╝ ╚═╝  ╚═╝ ╚═╝  ╚═╝ ╚══════╝  ╚═════╝ ',
      '',
      "Good day! It's Wednesday.",
      '',
      'You’re halfway to the weekend. Just think of it as Hump Day: ',
      'Over the hump and sliding into the weekend!',
      '',
      '',
      '',
      '',
    },
    ['Thursday'] = {
      '',
      '',
      '██████╗   ██████╗  ███╗   ███╗  █████╗  ██████╗  ███████╗  ██████╗ ',
      '██╔══██╗ ██╔═══██╗ ████╗ ████║ ██╔══██╗ ██╔══██╗ ██╔════╝ ██╔═══██╗',
      '██████╔╝ ██║   ██║ ██╔████╔██║ ███████║ ██████╔╝ █████╗   ██║   ██║',
      '██╔══██╗ ██║   ██║ ██║╚██╔╝██║ ██╔══██║ ██╔══██╗ ██╔══╝   ██║   ██║',
      '██║  ██║ ╚██████╔╝ ██║ ╚═╝ ██║ ██║  ██║ ██║  ██║ ███████╗ ╚██████╔╝',
      '╚═╝  ╚═╝  ╚═════╝  ╚═╝     ╚═╝ ╚═╝  ╚═╝ ╚═╝  ╚═╝ ╚══════╝  ╚═════╝ ',
      '',
      "Good day! It's Thursday.",
      '',
      'You’ve made it this far. Just keep in mind that Friday is coming.',
      'The weekend is so close, you can almost taste the freedom!',
      '',
      '',
      '',
      '',
    },
    ['Friday'] = {
      '',
      '',
      '██████╗   ██████╗  ███╗   ███╗  █████╗  ██████╗  ███████╗  ██████╗ ',
      '██╔══██╗ ██╔═══██╗ ████╗ ████║ ██╔══██╗ ██╔══██╗ ██╔════╝ ██╔═══██╗',
      '██████╔╝ ██║   ██║ ██╔████╔██║ ███████║ ██████╔╝ █████╗   ██║   ██║',
      '██╔══██╗ ██║   ██║ ██║╚██╔╝██║ ██╔══██║ ██╔══██╗ ██╔══╝   ██║   ██║',
      '██║  ██║ ╚██████╔╝ ██║ ╚═╝ ██║ ██║  ██║ ██║  ██║ ███████╗ ╚██████╔╝',
      '╚═╝  ╚═╝  ╚═════╝  ╚═╝     ╚═╝ ╚═╝  ╚═╝ ╚═╝  ╚═╝ ╚══════╝  ╚═════╝ ',
      '',
      "Good day! It's Saturday.",
      '',
      'The weekend is just around the corner. ',
      'Time to finish strong and get ready to relax and unwind!',
      '',
      '',
      '',
      '',
    },
    ['Saturday'] = {
      '',
      '',
      '██████╗   ██████╗  ███╗   ███╗  █████╗  ██████╗  ███████╗  ██████╗ ',
      '██╔══██╗ ██╔═══██╗ ████╗ ████║ ██╔══██╗ ██╔══██╗ ██╔════╝ ██╔═══██╗',
      '██████╔╝ ██║   ██║ ██╔████╔██║ ███████║ ██████╔╝ █████╗   ██║   ██║',
      '██╔══██╗ ██║   ██║ ██║╚██╔╝██║ ██╔══██║ ██╔══██╗ ██╔══╝   ██║   ██║',
      '██║  ██║ ╚██████╔╝ ██║ ╚═╝ ██║ ██║  ██║ ██║  ██║ ███████╗ ╚██████╔╝',
      '╚═╝  ╚═╝  ╚═════╝  ╚═╝     ╚═╝ ╚═╝  ╚═╝ ╚═╝  ╚═╝ ╚══════╝  ╚═════╝ ',
      '',
      "Good day! It's Saturday.",
      '',
      'The weekend is here, but you’ve got this one last push. ',
      'Finish up, and then it’s time to enjoy your well-deserved break!',
      '',
      '',
      '',
      '',
    },
    ['Sunday'] = {
      '',
      '',
      '██████╗   ██████╗  ███╗   ███╗  █████╗  ██████╗  ███████╗  ██████╗ ',
      '██╔══██╗ ██╔═══██╗ ████╗ ████║ ██╔══██╗ ██╔══██╗ ██╔════╝ ██╔═══██╗',
      '██████╔╝ ██║   ██║ ██╔████╔██║ ███████║ ██████╔╝ █████╗   ██║   ██║',
      '██╔══██╗ ██║   ██║ ██║╚██╔╝██║ ██╔══██║ ██╔══██╗ ██╔══╝   ██║   ██║',
      '██║  ██║ ╚██████╔╝ ██║ ╚═╝ ██║ ██║  ██║ ██║  ██║ ███████╗ ╚██████╔╝',
      '╚═╝  ╚═╝  ╚═════╝  ╚═╝     ╚═╝ ╚═╝  ╚═╝ ╚═╝  ╚═╝ ╚══════╝  ╚═════╝ ',
      '',
      "Good day! It's Sunday.",
      '',
      'Today is a perfect day to do nothing and then rest afterwards.',
      'Enjoy your day before Monday comes back around.',
      '',
      '',
      '',
      '',
    },
  }
end

local function default_header()
  return {
    '',
    ' ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗  █████╗ ██████╗ ██████╗  ',
    ' ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔═══██╗██╔══██╗██╔══██╗██╔══██╗ ',
    ' ██║  ██║███████║███████╗███████║██████╔╝██║   ██║███████║██████╔╝██║  ██║ ',
    ' ██║  ██║██╔══██║╚════██║██╔══██║██╔══██╗██║   ██║██╔══██║██╔══██╗██║  ██║ ',
    ' ██████╔╝██║  ██║███████║██║  ██║██████╔╝╚██████╔╝██║  ██║██║  ██║██████╔╝ ',
    ' ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝  ',
    '',
  }
end

local function week_header(concat, append)
  local week = week_ascii_text()
  local daysoftheweek =
    { 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday' }
  local day = daysoftheweek[os.date('*t').wday]
  local tbl = week[day]
  table.insert(tbl, os.date('%Y-%m-%d %H:%M:%S ') .. (concat or ''))
  if append then
    vim.list_extend(tbl, append)
  end
  table.insert(tbl, '')
  return tbl
end

local function generate_header(config)
  if not vim.bo[config.bufnr].modifiable then
    vim.bo[config.bufnr].modifiable = true
  end
  if not config.command then
    local header = config.week_header
        and config.week_header.enable
        and week_header(config.week_header.concat, config.week_header.append)
      or (config.header or default_header())
    api.nvim_buf_set_lines(config.bufnr, 0, -1, false, utils.center_align(header))

    for i, _ in ipairs(header) do
      vim.api.nvim_buf_add_highlight(config.bufnr, 0, 'DashboardHeader', i - 1, 0, -1)
    end
    return
  end

  local empty_table = utils.generate_empty_table(config.file_height + 4)
  api.nvim_buf_set_lines(config.bufnr, 0, -1, false, utils.center_align(empty_table))
  local preview = require('dashboard.preview')
  preview:open_preview({
    width = config.file_width,
    height = config.file_height,
    cmd = config.command .. ' ' .. config.file_path,
  })
end

return {
  generate_header = generate_header,
}
