import dataPreferences from '@ohos.data.preferences'
import CommonConstants from '../constants/CommonConsts'

export default class PreferencesDB {
  private dbName: string
  private prefDB: dataPreferences.Preferences

  constructor() {
    this.dbName = CommonConstants.PREF_DB_CONFIG.name
  }
  getDBInstance(callback: Function = () => {}) {
    let context = getContext(this) as Context
    dataPreferences.getPreferences(context, this.dbName, (err, preference) => {
      if (err) {
        console.error(`Failed to get preferences. Code:${err.code},message:${err.message}`);
        return
      }
      this.prefDB = preference
    })
  }


}