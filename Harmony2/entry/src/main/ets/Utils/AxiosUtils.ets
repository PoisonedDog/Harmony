import axios, { AxiosError, AxiosResponse, InternalAxiosRequestConfig } from '@ohos/axios'

export const httpObj = axios.create({
  baseURL: 'http://192.168.0.75:8029',
  timeout: 2000
})

httpObj.interceptors.request.use((config: InternalAxiosRequestConfig) => {
  // 通过AppStorage获取token
  const token='eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTU5NTc2NjcsInVzZXJuYW1lIjoiMTUyMDgzMzA4NjcifQ.m1beFbfsE3RQ0JB5V5hxJ96PaZf0PgWZD26exJD4aE'
  if (token) {
    // 若token存在，则将其添加到请求头
    config.headers['token'] = token
  }
  return config;
}, (error: AxiosError) => {
  //若出现异常，则提示异常信息
  return Promise.reject(error);
});