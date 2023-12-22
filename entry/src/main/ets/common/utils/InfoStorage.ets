import dataStorage from '@ohos.data.storage';

const STORAGE_PATH = '/data/data/info'

export class InfoStorage {
  setUserId(userId: string) {
    let store = dataStorage.getStorageSync(STORAGE_PATH)
    store.putSync('userId', userId)
  }

  getUserId() {
    let store = dataStorage.getStorageSync(STORAGE_PATH)
    return store.getSync('userId', '').toString()
  }

}
