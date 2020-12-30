def Settings( **kwargs ):
  client_data = kwargs[ 'client_data' ]
  return {
    'interpreter_path': client_data[ 'g:ycm_python_interpreter_path' ],
    'sys_path': client_data[ 'g:ycm_python_sys_path' ]
  }

def Settings( **kwargs ):
  if kwargs[ 'language' ] == 'java':
    return {
      'ls': {
        'java.format.onType.enabled': True
      }
    }
