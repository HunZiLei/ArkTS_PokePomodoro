import relationalStore from '@ohos.data.relationalStore';
import { TaskTable } from '../bean/ConstantsInterface'
import DDLDetail from '../bean/DDLDetailClass'

export default class CommonConstants {
  static readonly STORE_CONFIG: relationalStore.StoreConfig = {
    name: 'database.db',
    securityLevel: relationalStore.SecurityLevel.S1
  }

  static readonly PREF_DB_CONFIG: {
    name: 'user_preference'
  }

  static readonly TASK_TABLE_INIT: TaskTable = {
    tableName: 'taskTable',
    sqlCreate: 'CREATE TABLE IF NOT EXISTS taskTable' +
    '(id INTEGER PRIMARY KEY AUTOINCREMENT, task_name TEXT, ' +
    'subject INTEGER, start_date_stamp INTEGER, due_date_stamp INTEGER, ' +
    'is_completed BOOLEAN, detail TEXT, ddl_detail TEXT, is_top BOOLEAN)',
    columns: ['id', 'due_date_stamp', 'start_date_stamp', 'subject', 'detail', 'task_name', 'is_completed', 'ddl_detail', 'is_top']
  }

  static readonly RDB_TAG = "[DebugRDB]"

  static readonly DDL_COLOR = {
    easy: '#A5D61D',
    medium: '#F7CE00',
    hard: '#F9A01E',
    critical: '#E84026'
  }

  static readonly COLUMN_TYPE = {
    id: 'double',
    due_date_stamp: 'double',
    start_date_stamp: 'double',
    subject: 'string',
    detail: 'string',
    task_name: 'string',
    is_completed: 'boolean',
    ddl_detail: 'string',
    is_top: 'boolean'
  }

  static readonly DDL_DETAIL_PRESET: Array<DDLDetail> = [
    new DDLDetail('不急', '0.2-0.45-0.6'),
    new DDLDetail('放松', '0.2-0.5-0.8'),
    new DDLDetail('正常', '0.3-0.5-0.8'),
    new DDLDetail('紧张', '0.3-0.75-0.9'),
    new DDLDetail('困难', '0.5-0.8-0.99')
  ]
}
