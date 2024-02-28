const std = @import("std");

pub fn build(b: *std.Build) void {
    const optimize = b.standardOptimizeOption(.{});
    const lib = b.addStaticLibrary(null);
    // Looking to see if I acutally have to list each file individually,
    // as I've seen other do here.
    lib.addCSourceFiles(&.{
        "toonz/sources/toonz/toolbar.cpp",
    }, &.{});
    const exe = b.addExecutable(.{
        .name = "OpenToonz",
        .root_source_file = .{.path = "toonz/sources/toonz/main.cpp"},
        .optimize = optimize,
    });

    exe.addIncludePath("thirdparty/");
    
    b.default_step.dependOn(&exe.step);
}
