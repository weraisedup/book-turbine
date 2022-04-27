module.exports = (_sha, _comment) => {
  const fmt = iter => iter.join('\n')
  const extractTestName = ({id}, ctr) => `${ctr}\. _**${id}:**_`
  const extractFailMessage = json => {
    const {
      exception,
      full_description
    } = json

    console.log('exception', exception)
    console.log('full_description', full_description)
    return `\`${full_description}: failed with "${exception.message}"\``
  }

  const generateMessageAndInc = (blob, ctr) => {
    ctr = ctr + 1
    return `${extractTestName(blob, ctr)}\n${extractFailMessage(blob)}`
  }

  const runScript = () => {
    console.log('ENV[\'SHA\']', _sha)
    console.log('ENV[\'COMMENT\']', _comment)
    // console.log('core', core)

    const [raw_json, raw_covg] = _comment.split('Coverage report generated for RSpec to /usr/src/app/coverage. ')
    console.log('pre-parse json', raw_json)
    console.log('covg', raw_covg)

    const json = JSON.parse(raw_json)
    const covg = `_${raw_covg}_`
    const anyFailures = json.examples?.filter(blob => blob.status === 'failed')
    console.log('post-parse any_failures', anyFailures)
    console.log('covg', covg)

    if (anyFailures && anyFailures.length > 0) {
      const messages = anyFailures.map((blob, ct=0) => generateMessageAndInc(blob, ct))
      const summary = `### ${json.summary_line}`
      const divider = '---'
      const sha = `_As of ${_sha}_`
      const header = fmt([sha, covg, summary, divider])

      console.log('header', header)
      console.log('messages', messages)

      return fmt([header, messages])
    } else {
      return null
    }
  }

  return runScript()
}

