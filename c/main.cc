#include <iostream>
#include "jni.h"
#include <string.h>
#include <typeinfo>
int main()
{
  JavaVMOption options[1];
  JNIEnv *env;
  JavaVM *jvm;
  JavaVMInitArgs vm_args;

  options[0].optionString = const_cast<char *>("-Djava.class.path=./target:./jar/xeger-1.0-SNAPSHOT.jar:./jar/automaton.jar");
  memset(&vm_args, 0, sizeof(vm_args));
  vm_args.version = JNI_VERSION_1_8;
  vm_args.nOptions = 1;
  vm_args.options = options;

  long status = JNI_CreateJavaVM(&jvm, (void**)&env, &vm_args);
  if( status != JNI_OK ) {
    std::cout << "JNI creation Failed : "
              << std::endl;
    return 1;
  }
  jclass cls = env->FindClass("simple/JavaCode");
  if( cls != 0 ) {
  	jmethodID mid = env->GetStaticMethodID(cls, "giveMeString", "(I)Ljava/lang/String;");
    if( mid != 0 ) {
     jstring temp = (jstring)  env->CallObjectMethod(cls, mid,35);
     
    const char *regexGeneratedString = env->GetStringUTFChars(temp, 0);
    printf("Result of implementation : %s\n" , regexGeneratedString);
    // env->ReleaseStringUTFChars(temp, regexGeneratedString); 
    } else {
      return 1;
    }
  } else {
    return 1;
  }
  jvm->DestroyJavaVM();
  return 0;
}
