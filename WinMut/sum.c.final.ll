; ModuleID = 'sum.c'
source_filename = "sum.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Mutation = type { i32, i32, i32, i64, i64 }
%struct.RegMutInfo = type { %struct.Mutation*, i32, i32, i32, i8* }
%struct.BlockRegMutBound = type { i32, i32 }
%struct.MutSpec.0 = type { i32, i32, [1 x %struct.MutSpec] }
%struct.MutSpec = type { i32, i32 }
%struct.GoodvarArg = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.MutSpec.0*, %struct.MutSpec.0*, %struct.MutSpec.0*, %struct.GoodvarArgInBlock*, %struct.RegMutInfo* }
%struct.GoodvarArgInBlock = type { i32, [1 x %struct.GoodvarArg*] }

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@mutarray = internal global [15 x %struct.Mutation] [%struct.Mutation { i32 7, i32 18, i32 0, i64 0, i64 0 }, %struct.Mutation { i32 7, i32 18, i32 0, i64 0, i64 1 }, %struct.Mutation { i32 7, i32 18, i32 0, i64 0, i64 2 }, %struct.Mutation { i32 7, i32 18, i32 0, i64 1, i64 0 }, %struct.Mutation { i32 7, i32 18, i32 0, i64 1, i64 1 }, %struct.Mutation { i32 7, i32 18, i32 0, i64 1, i64 2 }, %struct.Mutation { i32 8, i32 18, i32 0, i64 0, i64 1 }, %struct.Mutation { i32 9, i32 18, i32 0, i64 0, i64 0 }, %struct.Mutation { i32 9, i32 18, i32 1, i64 0, i64 0 }, %struct.Mutation { i32 0, i32 18, i32 11, i64 0, i64 0 }, %struct.Mutation { i32 0, i32 18, i32 13, i64 0, i64 0 }, %struct.Mutation { i32 0, i32 18, i32 15, i64 0, i64 0 }, %struct.Mutation { i32 0, i32 18, i32 17, i64 0, i64 0 }, %struct.Mutation { i32 0, i32 18, i32 20, i64 0, i64 0 }, %struct.Mutation { i32 0, i32 18, i32 21, i64 0, i64 0 }]
@0 = internal constant [6 x i8] c"sum.c\00"
@mutrmi = internal global %struct.RegMutInfo { %struct.Mutation* getelementptr inbounds ([15 x %struct.Mutation], [15 x %struct.Mutation]* @mutarray, i32 0, i32 0), i32 15, i32 0, i32 0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @0, i32 0, i32 0) }
@HOLDER = external global [1024 x i32]
@1 = internal global %struct.BlockRegMutBound { i32 1, i32 15 }
@2 = internal constant %struct.BlockRegMutBound { i32 1, i32 15 }
@BlockBoundArray = internal constant [1 x %struct.BlockRegMutBound*] [%struct.BlockRegMutBound* @1]
@MutSpecsArray = internal constant [0 x %struct.MutSpec.0*] zeroinitializer
@GoodvarArgArray = internal constant [0 x %struct.GoodvarArg*] zeroinitializer
@llvm.global_ctors = appending global [2 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 100, void ()* @__accmut_register_ctor, i8* null }, { i32, void ()*, i8* } { i32 100, void ()* @__accmut_set_max_ctor, i8* null }]

; Function Attrs: norecurse nounwind readnone uwtable
define i32 @sum(i32, i32) local_unnamed_addr #0 {
  %3 = load i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @HOLDER, i32 0, i32 0)
  %4 = icmp ne i32 %3, 0
  %5 = load i32, i32* getelementptr inbounds (%struct.BlockRegMutBound, %struct.BlockRegMutBound* @1, i32 0, i32 0)
  %6 = icmp slt i32 %3, %5
  %7 = load i32, i32* getelementptr inbounds (%struct.BlockRegMutBound, %struct.BlockRegMutBound* @1, i32 0, i32 1)
  %8 = icmp sgt i32 %3, %7
  %9 = or i1 %6, %8
  %10 = and i1 %9, %4
  br i1 %10, label %26, label %11, !prof !2

; <label>:11:                                     ; preds = %2
  br label %12

; <label>:12:                                     ; preds = %11
  %13 = load i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @HOLDER, i32 0, i32 1)
  %14 = icmp ne i32 %13, 0
  %15 = icmp slt i32 %13, 1
  %16 = icmp sgt i32 %13, 15
  %17 = or i1 %15, %16
  %18 = and i1 %17, %14
  br i1 %18, label %21, label %19, !prof !2

; <label>:19:                                     ; preds = %12
  %20 = call i32 @__accmut__process_i32_arith(%struct.RegMutInfo* @mutrmi, i32 1, i32 15, i32 %0, i32 %1)
  br label %23

; <label>:21:                                     ; preds = %12
  %22 = sdiv i32 %0, %1
  br label %23

; <label>:23:                                     ; preds = %21, %19
  %24 = phi i32 [ %20, %19 ], [ %22, %21 ]
  br label %25

; <label>:25:                                     ; preds = %23
  ret i32 %24

; <label>:26:                                     ; preds = %2
  %27 = sdiv i32 %0, %1
  ret i32 %27
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

declare void @__accmut__register(%struct.RegMutInfo*, %struct.BlockRegMutBound**, i32, %struct.MutSpec.0**, i32, %struct.GoodvarArg**, i32)

declare void @__accmut__set_max_num(i64, i64)

declare void @__accmut__log(i32, i32, i32, i32, i32, i1, i32)

declare i32 @__accmut__stdcall_i32()

declare i64 @__accmut__stdcall_i64()

declare void @__accmut__stdcall_void()

declare void @__accmut__std_store()

declare i32 @__accmut__process_i32_arith(%struct.RegMutInfo*, i32, i32, i32, i32)

declare i64 @__accmut__process_i64_arith(%struct.RegMutInfo*, i32, i32, i64, i64)

declare i32 @__accmut__process_i32_cmp(%struct.RegMutInfo*, i32, i32, i32, i32)

declare i32 @__accmut__process_i64_cmp(%struct.RegMutInfo*, i32, i32, i64, i64)

declare i32 @__accmut__prepare_call(%struct.RegMutInfo*, i32, i32, i32, ...)

declare i32 @__accmut__prepare_st_i32(%struct.RegMutInfo*, i32, i32, i32, i32*)

declare i32 @__accmut__prepare_st_i64(%struct.RegMutInfo*, i32, i32, i64, i64*)

declare void @__accmut__GoodVar_TablePush(i64, i64)

declare void @__accmut__GoodVar_TablePop()

declare void @__accmut__GoodVar_TablePush_max()

declare i32 @__accmut__process_i32_arith_GoodVar(i32, i32, %struct.GoodvarArg*)

declare i32 @__accmut__process_i32_arith_GoodVar_init(i32, i32, %struct.GoodvarArg*)

declare i64 @__accmut__process_i64_arith_GoodVar(i64, i64, %struct.GoodvarArg*)

declare i64 @__accmut__process_i64_arith_GoodVar_init(i64, i64, %struct.GoodvarArg*)

declare i32 @__accmut__process_i32_cmp_GoodVar(i32, i32, %struct.GoodvarArg*)

declare i32 @__accmut__process_i32_cmp_GoodVar_init(i32, i32, %struct.GoodvarArg*)

declare i32 @__accmut__process_i64_cmp_GoodVar(i64, i64, %struct.GoodvarArg*)

declare i32 @__accmut__process_i64_cmp_GoodVar_init(i64, i64, %struct.GoodvarArg*)

define internal void @__accmut_register_ctor() {
  call void @__accmut__register(%struct.RegMutInfo* @mutrmi, %struct.BlockRegMutBound** getelementptr inbounds ([1 x %struct.BlockRegMutBound*], [1 x %struct.BlockRegMutBound*]* @BlockBoundArray, i32 0, i32 0), i32 1, %struct.MutSpec.0** getelementptr inbounds ([0 x %struct.MutSpec.0*], [0 x %struct.MutSpec.0*]* @MutSpecsArray, i32 0, i32 0), i32 0, %struct.GoodvarArg** getelementptr inbounds ([0 x %struct.GoodvarArg*], [0 x %struct.GoodvarArg*]* @GoodvarArgArray, i32 0, i32 0), i32 0)
  ret void
}

define internal void @__accmut_set_max_ctor() {
  call void @__accmut__set_max_num(i64 0, i64 0)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #2 {
  tail call void @__accmut__init(i32 %0, i8** %1)
  br label %3

; <label>:3:                                      ; preds = %2
  %4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 3)
  call void @exit(i32 0)
  unreachable
}

declare void @__accmut__init(i32, i8**)

; Function Attrs: noreturn
declare void @exit(i32) #3

attributes #0 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0 (tags/RELEASE_600/final) (https://github.com/winmutase21/WinMutASE21Artifact e440cd2b331d26c6ea31a0e1d314a40c450ed069)"}
!2 = !{!"branch_weights", i32 2000, i32 4}
