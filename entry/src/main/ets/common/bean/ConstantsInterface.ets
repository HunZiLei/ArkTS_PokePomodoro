export interface TaskTable {
  tableName: string,
  sqlCreate: string,
  columns: string[]
}

export interface TaskDataInter {
  id: number
  subject: number
  detail: string
  task_name: string
  start_date_stamp: number
  due_date_stamp: number
  is_completed: boolean
  ddl_detail: string
}